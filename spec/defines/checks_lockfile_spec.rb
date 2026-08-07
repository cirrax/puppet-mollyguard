# frozen_string_literal: true

require 'spec_helper'

describe 'mollyguard::checks::lockfile' do
  let :default_params do
    { destination: '/tmp/test',
      check_name: 'lockfile-molly-test',
      lockfile: '/tmp/lock.lck',
      sort: '20',
      owner: 'root',
      group: 'root',
      mode: '0755', }
  end

  shared_examples 'mollyguard::checks::lockfile define' do
    context 'it compiles with all dependencies' do
      it { is_expected.to compile.with_all_deps }
    end

    it {
      is_expected.to contain_file("#{params[:destination]}/#{params[:sort]}-#{params[:check_name]}")
        .with_ensure('file')
        .with_owner(params[:owner])
        .with_group(params[:group])
        .with_mode(params[:mode])
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'whith defaults' do
        let(:title) { 'test-check' }
        let :params do
          default_params
        end

        it_behaves_like 'mollyguard::checks::lockfile define'
      end

      context 'whith non-defaults' do
        let(:title) { 'another-check' }
        let :params do
          default_params.merge(
            destination: '/tmp/somewhereelse',
            check_name: 'another-blah-check',
            lockfile: '/tmp/anotherlock.lck',
            sort: '42',
            owner: 'someone',
            group: 'someone',
            mode: '4242',
          )
        end

        it_behaves_like 'mollyguard::checks::lockfile define'
      end
    end
  end
end
