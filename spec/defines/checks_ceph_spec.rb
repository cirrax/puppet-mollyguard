
require 'spec_helper'

describe 'mollyguard::checks::ceph' do

  let :default_params do
     { :destination => '/tmp/test',
       :check_name  => 'ceph-molly-test',
       :sort        => '20',
       :owner       => 'root',
       :group       => 'root',
       :mode        => '0755',
     }
  end


  shared_examples 'mollyguard::checks::ceph define' do

    context 'it compiles with all dependencies' do
      it { is_expected.to compile.with_all_deps }
    end
 
    it { is_expected.to contain_file( params[:destination] + '/' + params[:sort] + '-' + params[:check_name] )
      .with_ensure('present')
      .with_owner(params[:owner])
      .with_group(params[:group])
      .with_mode(params[:mode])
    }
  end

  context 'whith defaults' do
    let (:title) { 'test-check' }
    let :params do
      default_params
    end
    it_behaves_like 'mollyguard::checks::ceph define'

  end

  context 'whith non-defaults' do
    let (:title) { 'another-check' }
    let :params do
      default_params.merge( 
       :destination => '/tmp/somewhereelse',
       :check_name => 'another-blah-check',
       :sort        => '42',
       :owner       => 'someone',
       :group       => 'someone',
       :mode        => '4242',
      )
    end
    it_behaves_like 'mollyguard::checks::ceph define'
  end
end

