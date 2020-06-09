# @summary Configures the different authentication methods that will be accepted on the system
#          https://docs.microsoft.com/en-us/windows/win32/winrm/authentication-for-remote-connections
class winrm::config::auth (
  Boolean $auth_basic_enable     = $winrm::auth_basic_enable,
  Boolean $auth_credssp_enable   = $winrm::auth_credssp_enable,
  Boolean $auth_kerberos_enable  = $winrm::auth_kerberos_enable,
  Boolean $auth_negotiate_enable = $winrm::auth_negotiate_enable,
) {
  exec { 'Configure-Auth':
    command  => template('winrm/auth/auth_settings.ps1.erb'),
    provider => 'powershell',
    unless   => template('winrm/auth/auth_settings_onlyif.ps1.erb'),
  }
}
