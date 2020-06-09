require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      describe "winrm::config::auth class without any parameters on #{os}" do
        let(:params) { {} }

        it { is_expected.to contain_exec('Configure-Auth').with_provider('powershell') }
      end

      describe "winrm::config::auth class with true param on #{os}" do
        let(:params) { { auth_basic_enable: true, auth_credssp_enable: true, auth_kerberos_enable: true, auth_negotiate_enable: true } }

        it { is_expected.to contain_exec('Configure-Auth').with_provider('powershell') }
      end
    end
  end
end
