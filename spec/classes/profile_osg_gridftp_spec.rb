require 'spec_helper'

describe 'profile::osg::gridftp' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :concat_basedir => '/dne',
        })
      end
      let(:params) {{ }}

      it { should compile.with_all_deps }
      it { should create_class('profile::osg::gridftp') }
    end
  end
end