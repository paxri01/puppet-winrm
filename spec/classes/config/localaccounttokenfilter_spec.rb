require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      describe "winrm::config::localaccounttokenfilter class without any parameters on #{os}" do
        let(:params) { {} }

        it {
          is_expected.to contain_registry_value('LocalAccountTokenFilterPolicy')
            .with_ensure('present')
            .with_path('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\LocalAccountTokenFilterPolicy')
            .with_type('dword')
            .with_data('1')
        }
      end

      describe "winrm::config::localaccounttokenfilter class with true param on #{os}" do
        let(:params) { { local_account_token_filter_policy_enable: true } }

        it {
          is_expected.to contain_registry_value('LocalAccountTokenFilterPolicy')
            .with_ensure('present')
            .with_path('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\LocalAccountTokenFilterPolicy')
            .with_type('dword')
            .with_data('1')
        }
      end

      describe "winrm::config::localaccounttokenfilter class with false param on #{os}" do
        let(:params) { { local_account_token_filter_policy_enable: false } }

        it {
          is_expected.to contain_registry_value('LocalAccountTokenFilterPolicy')
            .with_ensure('present')
            .with_path('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\LocalAccountTokenFilterPolicy')
            .with_type('dword')
            .with_data('0')
        }
      end
    end
  end
end
