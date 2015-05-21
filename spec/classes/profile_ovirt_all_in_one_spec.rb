require 'spec_helper'

describe 'profile::ovirt::all_in_one' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :concat_basedir => '/dne',
        })
      end
      let(:params) {{ }}

      it { should compile.with_all_deps }
      it { should create_class('profile::ovirt::all_in_one') }

    end
  end
end
