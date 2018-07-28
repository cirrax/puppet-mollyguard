
require 'spec_helper'

describe 'mollyguard' do
  let :default_params do
     { :package_ensure    => 'present',
       :packages          => ['molly-guard'],
       :checks            => {},
       :check_destination => '/etc/molly-guard/run.d',
       :purge_checks      => true,
       :ignore_sys_checks => ['10-print-message', '30-query-hostname'],
     }
  end

  shared_examples 'mollyguard shared example' do
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_package( 'molly-guard')
      .with_ensure(params[:package_ensure])
      .with_tag('molly-guard-packages')
    }
  end

  shared_examples 'mollyguard purge checks shared example' do
    it { is_expected.to contain_file( params[:check_destination] )
      .with_ensure('directory')
      .with_purge(true)
      .with_recurse(true)
    }
  end

  context 'with defaults' do
    let :params do
      default_params
    end
    it_behaves_like 'mollyguard shared example'
    it_behaves_like 'mollyguard purge checks shared example'

    it { is_expected.to contain_file( params[:check_destination] + '/10-print-message' ) }
    it { is_expected.to contain_file( params[:check_destination] + '/30-query-hostname' ) }
  end

  context 'with non defaults' do
    let :params do
      default_params.merge(
	:package_ensure    => 'installed',
        :packages          => ['molly-guard', 'blah'],
        :check_destination => '/tmp',
        :ignore_sys_checks => ['30-whatever', '30-another'],
      )
    end
    it_behaves_like 'mollyguard shared example'
    it_behaves_like 'mollyguard purge checks shared example'

    it { is_expected.to contain_file( params[:check_destination] + '/30-whatever' ) }
    it { is_expected.to contain_file( params[:check_destination] + '/30-another' ) }

    it { is_expected.to contain_package( 'blah')
      .with_ensure(params[:package_ensure])
      .with_tag('molly-guard-packages')
    }
  end

  context 'with non purging checks' do
    let :params do
      default_params.merge(
	:purge_checks    => false,
        :check_destination => '/tmp',
      )
    end
    it_behaves_like 'mollyguard shared example'

    it { is_expected.to_not contain_file( params[:check_destination] )
    }

    it { is_expected.to_not contain_file( params[:check_destination]) }
    it { is_expected.to_not contain_file( params[:check_destination] + '/10-print-message' ) }
    it { is_expected.to_not contain_file( params[:check_destination] + '/30-query-hostname' ) }
  end
end

