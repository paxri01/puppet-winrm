# https://docs.microsoft.com/en-us/windows/win32/winrm/authentication-for-remote-connections
class winrm::config::auth (
  Boolean $basic_enable     = $winrm::auth_basic_enable,
  Boolean $credssp_enable   = $winrm::auth_credssp_enable,
  Boolean $kerberos_enable  = $winrm::auth_kerberos_enable,
  Boolean $negotiate_enable = $winrm::auth_negotiate_enable,
) {
  exec { 'Configure-Auth':
    command  => template('winrm/auth/auth_settings.ps1.erb'),
    provider => 'powershell',
    onlyif   => template('winrm/auth/auth_settings_onlyif.ps1.erb'),
  }
}
