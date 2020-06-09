require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      describe "winrm::config::ps_remoting class without any parameters on #{os}" do
        let(:params) { {} }

        it {
          is_expected.to contain_exec('Enable-PSRemoting')
            .with_command('Enable-PSRemoting -Force -ErrorAction Stop')
            .with_unless('If (!(Get-PSSessionConfiguration -Verbose:$false) -or (!(Get-ChildItem WSMan:\localhost\Listener))) { exit 1 }')
            .with_provider('powershell')
        }
      end

      describe "winrm::config::ps_remoting class with param: fakse on #{os}" do
        let(:params) { { skip_network_profile_check: false } }

        it {
          is_expected.to contain_exec('Enable-PSRemoting')
            .with_command('Enable-PSRemoting -Force -ErrorAction Stop')
            .with_unless('If (!(Get-PSSessionConfiguration -Verbose:$false) -or (!(Get-ChildItem WSMan:\localhost\Listener))) { exit 1 }')
            .with_provider('powershell')
        }
      end

      describe "winrm::config::ps_remoting class with param: true on #{os}" do
        let(:params) { { skip_network_profile_check: true } }

        it {
          is_expected.to contain_exec('Enable-PSRemoting')
            .with_command('Enable-PSRemoting -SkipNetworkProfileCheck -Force -ErrorAction Stop')
            .with_unless('If (!(Get-PSSessionConfiguration -Verbose:$false) -or (!(Get-ChildItem WSMan:\localhost\Listener))) { exit 1 }')
            .with_provider('powershell')
        }
      end
    end
  end
end
