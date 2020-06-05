require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      describe "winrm::config::firewall class without any parameters on #{os}" do
        let(:params) { {} }

        it { is_expected.to contain_exec('Configure-Firewall-Rules').with_provider('powershell') }
      end

      describe "winrm::config::firewall class with true param on #{os}" do
        let(:params) { { http_listener_enable: true, https_listener_enable: true } }

        it { is_expected.to contain_exec('Configure-Firewall-Rules').with_provider('powershell') }
      end
    end
  end
end
