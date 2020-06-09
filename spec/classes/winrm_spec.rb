require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end

      describe "winrm class without any parameters on #{os}" do
        let(:params) { {} }

        # it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('winrm::params') }
        it { is_expected.to contain_class('winrm::service').that_comes_before('Class[winrm::config]') }
        it { is_expected.to contain_class('winrm::config') }
      end
    end
  end
end
