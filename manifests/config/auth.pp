# @summary Configures the different authentication methods that will be accepted on the system
#          https://docs.microsoft.com/en-us/windows/win32/winrm/authentication-for-remote-connections
#
# @param [Boolean] auth_basic_enable
#   Is Basic Authentication allowed? Default is false
#
# @param [Boolean] auth_credssp_enable
#   Is CredSSP Authentication allowed? Default is false
#
# @param [Boolean] auth_kerberos_enable
#  Is Kerberos Authentication allowed? Default is true
#
# @param [Boolean] auth_negotiate_enable
#  Is Negotiate Authentication allowed? Default is true
#
# @example Usage:
#   class { 'winrm::config::auth':
#     auth_basic_enable     => false,
#     auth_credssp_enable   => false,
#     auth_kerberos_enable  => true,
#     auth_negotiate_enable => true,
#   }
#
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
