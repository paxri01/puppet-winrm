# @summary Ensure the service is available and running and set to Automatic on boot.
#
class winrm::service {
  service { 'WinRM':
    ensure => running,
    # Sets startup type to 'Automatic'
    enable => true,
  }
}
