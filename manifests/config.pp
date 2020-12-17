# Contains all items to configure WinRM as well as passing variables to the methods.
class winrm::config {
  assert_private()

  contain winrm::config::allow_unencrypted
  contain winrm::config::ps_remoting
  contain winrm::config::execution_policy
  contain winrm::config::localaccounttokenfilter
  contain winrm::config::auth
  contain winrm::config::listener::http
  contain winrm::config::listener::https
  contain winrm::config::firewall

  Class['winrm::config::allow_unencrypted']
  -> Class['winrm::config::ps_remoting']
  -> Class['winrm::config::execution_policy']
  -> Class['winrm::config::localaccounttokenfilter']
  -> Class['winrm::config::auth']
  -> Class['winrm::config::listener::http']
  -> Class['winrm::config::listener::https']
  -> Class['winrm::config::firewall']
}
