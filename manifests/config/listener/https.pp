# @summary Configures the SSL (HTTPS) listener on the system. Also attaches a Certificate to the listen.
#          Will either generate a self signed one or a hash can be passed in.
#          https://docs.microsoft.com/en-us/powershell/module/microsoft.wsman.management/new-wsmaninstance?view=powershell-7
#          https://docs.microsoft.com/en-us/powershell/module/microsoft.wsman.management/remove-wsmaninstance?view=powershell-7
#
# @param [String] certificate_hash
#  If not using a Self Signed Certificate then this hash can be passed in
#  and used for the HTTPs/SSL listener
#
# @param [Integer] cert_validity_days
#  Length of time in days the Self Signed certificate is good for. Default is 1095
#
# @param [Boolean] https_listener_enable
#  Should winrm be listening for https connections. Defialt is true
#
# @example Usage:
#   class { 'winrm::config::listener::https':
#     cert_validity_days    => 1095,
#     certificate_hash      => 'test cert hash',
#     https_listener_enable => true,
#   }
#
class winrm::config::listener::https (
  Boolean $https_listener_enable = $winrm::https_listener_enable,
  String $certificate_hash       = $winrm::certificate_hash,
  Integer $cert_validity_days    = $winrm::cert_validity_days,
) {
  exec { 'Configure-HTTPS-Listener':
    command  => template('winrm/listener/https_listener.ps1.erb'),
    provider => 'powershell',
    onlyif   => template('winrm/listener/https_listener_onlyif.ps1.erb'),
  }
}
