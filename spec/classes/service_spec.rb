require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      describe "winrm class without any parameters on #{os}" do
        let(:params) { {} }

        it { is_expected.to contain_service('WinRM').with_enable(true) }
      end
    end
  end
end
