require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end

      describe "winrm::config class without any parameters on #{os}" do
        it { is_expected.to contain_class('winrm::config::allow_unencrypted').that_comes_before('Class[winrm::config::ps_remoting]') }
        it { is_expected.to contain_class('winrm::config::ps_remoting').that_comes_before('Class[winrm::config::execution_policy]') }
        it { is_expected.to contain_class('winrm::config::execution_policy').that_comes_before('Class[winrm::config::localaccounttokenfilter]') }
        it {
          is_expected.to contain_class('winrm::config::localaccounttokenfilter')
            .that_comes_before('Class[winrm::config::auth]')
        }
        it { is_expected.to contain_class('winrm::config::auth').that_comes_before('Class[winrm::config::listener::http]') }
        it { is_expected.to contain_class('winrm::config::listener::http').that_comes_before('Class[winrm::config::listener::https]') }
        it { is_expected.to contain_class('winrm::config::listener::https').that_comes_before('Class[winrm::config::firewall]') }
        it { is_expected.to contain_class('winrm::config::firewall') }
      end
    end
  end
end
