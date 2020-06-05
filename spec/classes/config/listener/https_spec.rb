require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      describe "winrm::config::listener::https class without any parameters on #{os}" do
        let(:params) { {} }

        it { is_expected.to contain_exec('Configure-HTTPS-Listener').with_provider('powershell') }
      end

      describe "winrm::config::listener::https class with false param on #{os}" do
        let(:params) { { https_listener_enable: false, cert_validity_days: 1234 } }

        it { is_expected.to contain_exec('Configure-HTTPS-Listener').with_provider('powershell') }
      end

      describe "winrm::config::listener::https class with certificate_hash param on #{os}" do
        let(:params) { { https_listener_enable: true, certificate_hash: 'hashstring' } }

        it { is_expected.to contain_exec('Configure-HTTPS-Listener').with_provider('powershell') }
      end
    end
  end
end
