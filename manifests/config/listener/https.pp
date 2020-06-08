# @summary Configures the SSL (HTTPS) listener on the system. Also attaches a Certificate to the listen.
#          Will either generate a self signed one or a hash can be passed in.
#          https://docs.microsoft.com/en-us/powershell/module/microsoft.wsman.management/new-wsmaninstance?view=powershell-7
#          https://docs.microsoft.com/en-us/powershell/module/microsoft.wsman.management/remove-wsmaninstance?view=powershell-7
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
