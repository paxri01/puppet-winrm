require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      describe "winrm::config::allow_unencrypted class without any parameters on #{os}" do
        let(:params) { {} }

        it {
          is_expected.to contain_exec('Block-Unencrypted-Traffic')
            .with_command('Set-Item -Path "WSMan:\localhost\Service\AllowUnencrypted" -Value $false')
            .with_unless('If ((Get-ChildItem WSMan:\localhost\Service\AllowUnencrypted).Value -ne $false) { exit 1 }')
            .with_provider('powershell')
        }
      end

      describe "winrm::config::allow_unencrypted class with false param on #{os}" do
        let(:params) { { allow_unencrypted_enable: false } }

        it {
          is_expected.to contain_exec('Block-Unencrypted-Traffic')
            .with_command('Set-Item -Path "WSMan:\localhost\Service\AllowUnencrypted" -Value $false')
            .with_unless('If ((Get-ChildItem WSMan:\localhost\Service\AllowUnencrypted).Value -ne $false) { exit 1 }')
            .with_provider('powershell')
        }
      end

      describe "winrm::config::allow_unencrypted class with true param on #{os}" do
        let(:params) { { allow_unencrypted_enable: true } }

        it {
          is_expected.to contain_exec('Allow-Unencrypted-Traffic')
            .with_command('Set-Item -Path "WSMan:\localhost\Service\AllowUnencrypted" -Value $true')
            .with_unless('If ((Get-ChildItem WSMan:\localhost\Service\AllowUnencrypted).Value -ne $true) { exit 1 }')
            .with_provider('powershell')
        }
      end
    end
  end
end
