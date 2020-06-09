require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      describe "winrm::config::execution_policy class without any parameters on #{os}" do
        let(:params) { {} }

        it {
          is_expected.to contain_exec('Set-Execution-Policy')
            .with_command('Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force')
            .with_unless("If ((Get-ExecutionPolicy -Scope LocalMachine) -ne 'RemoteSigned') { exit 1 }")
            .with_provider('powershell')
        }
      end

      describe "winrm::config::execution_policy class with RemoteSigned param on #{os}" do
        let(:params) { { execution_policy: 'RemoteSigned' } }

        it {
          is_expected.to contain_exec('Set-Execution-Policy')
            .with_command('Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force')
            .with_unless("If ((Get-ExecutionPolicy -Scope LocalMachine) -ne 'RemoteSigned') { exit 1 }")
            .with_provider('powershell')
        }
      end

      describe "winrm::config::execution_policy class with AllSigned param on #{os}" do
        let(:params) { { execution_policy: 'AllSigned' } }

        it {
          is_expected.to contain_exec('Set-Execution-Policy')
            .with_command('Set-ExecutionPolicy -ExecutionPolicy AllSigned -Scope LocalMachine -Force')
            .with_unless("If ((Get-ExecutionPolicy -Scope LocalMachine) -ne 'AllSigned') { exit 1 }")
            .with_provider('powershell')
        }
      end

      describe "winrm::config::execution_policy class with Bypass param on #{os}" do
        let(:params) { { execution_policy: 'Bypass' } }

        it {
          is_expected.to contain_exec('Set-Execution-Policy')
            .with_command('Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine -Force')
            .with_unless("If ((Get-ExecutionPolicy -Scope LocalMachine) -ne 'Bypass') { exit 1 }")
            .with_provider('powershell')
        }
      end

      describe "winrm::config::execution_policy class with Restricted param on #{os}" do
        let(:params) { { execution_policy: 'Restricted' } }

        it {
          is_expected.to contain_exec('Set-Execution-Policy')
            .with_command('Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope LocalMachine -Force')
            .with_unless("If ((Get-ExecutionPolicy -Scope LocalMachine) -ne 'Restricted') { exit 1 }")
            .with_provider('powershell')
        }
      end

      describe "winrm::config::execution_policy class with Undefined param on #{os}" do
        let(:params) { { execution_policy: 'Undefined' } }

        it {
          is_expected.to contain_exec('Set-Execution-Policy')
            .with_command('Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine -Force')
            .with_unless("If ((Get-ExecutionPolicy -Scope LocalMachine) -ne 'Undefined') { exit 1 }")
            .with_provider('powershell')
        }
      end

      describe "winrm::config::execution_policy class with Unrestricted param on #{os}" do
        let(:params) { { execution_policy: 'Unrestricted' } }

        it {
          is_expected.to contain_exec('Set-Execution-Policy')
            .with_command('Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force')
            .with_unless("If ((Get-ExecutionPolicy -Scope LocalMachine) -ne 'Unrestricted') { exit 1 }")
            .with_provider('powershell')
        }
      end
    end
  end
end
