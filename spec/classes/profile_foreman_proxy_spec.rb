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

      # Can't use .with_all_deps here due to odd name given to /etc/sudoers.d/ in sudo module instead of /etc/sudoers.d
      it { should compile }
      it { should create_class('profile::foreman_proxy') }
    end
  end
end
