require 'spec_helper'

describe 'winrm' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      describe "winrm::config::listener class without any parameters on #{os}" do
        it { is_expected.to contain_class('winrm::config::listener::http') }
        it { is_expected.to contain_class('winrm::config::listener::https') }
      end
    end
  end
end
