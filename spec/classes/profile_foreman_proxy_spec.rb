require 'spec_helper'

describe 'profile::foreman_proxy' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :concat_basedir => '/dne',
        })
      end
      let(:params) {{ }}

      it { should compile.with_all_deps }
      it { should contain_class('sudo').with_config_dir('/etc/sudoers.d') }
      it { should create_class('profile::foreman_proxy') }
    end
  end
end
