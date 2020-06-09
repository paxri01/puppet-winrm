require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      describe "winrm::config::listener::http class without any parameters on #{os}" do
        let(:params) { {} }

        it {
          is_expected.to contain_exec('Disable-HTTP-Listener')
            .with_command('Remove-WSManInstance -ResourceUri winrm/config/Listener -SelectorSet @{Address="*";Transport="HTTP"}')
            .with_unless('If (((Get-ChildItem WSMan:\localhost\Listener) | Where {$_.Keys -like "TRANSPORT=HTTP"})) { Exit 1 }')
            .with_provider('powershell')
        }
      end

      describe "winrm::config::listener::http class with param: fakse on #{os}" do
        let(:params) { { http_listener_enable: false } }

        it {
          is_expected.to contain_exec('Disable-HTTP-Listener')
            .with_command('Remove-WSManInstance -ResourceUri winrm/config/Listener -SelectorSet @{Address="*";Transport="HTTP"}')
            .with_unless('If (((Get-ChildItem WSMan:\localhost\Listener) | Where {$_.Keys -like "TRANSPORT=HTTP"})) { Exit 1 }')
            .with_provider('powershell')
        }
      end

      describe "winrm::config::listener::http class with param: true on #{os}" do
        let(:params) { { http_listener_enable: true } }

        it {
          is_expected.to contain_exec('Enable-HTTP-Listener')
            .with_command('New-WSManInstance -ResourceUri winrm/config/Listener -SelectorSet @{Address="*";Transport="HTTP"}')
            .with_unless('If (!((Get-ChildItem WSMan:\localhost\Listener) | Where {$_.Keys -like "TRANSPORT=HTTP"})) { Exit 1 }')
            .with_provider('powershell')
        }
      end
    end
  end
end
