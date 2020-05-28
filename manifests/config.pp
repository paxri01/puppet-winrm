class winrm::config {

  assert_private()

  $allow_unencrypted_enable                 = $winrm::params::allow_unencrypted_enable
  $auth_basic_enable                        = $winrm::params::auth_basic_enable
  $auth_credssp_enable                      = $winrm::params::auth_credssp_enable
  $auth_kerberos_enable                     = $winrm::params::auth_kerberos_enable
  $auth_negotiate_enable                    = $winrm::params::auth_negotiate_enable
  $certificate_hash                         = $winrm::params::certificate_hash
  $cert_validity_days                       = $winrm::params::cert_validity_days
  $execution_policy                         = $winrm::params::execution_policy
  $http_listener_enable                     = $winrm::params::http_listener_enable
  $https_listener_enable                    = $winrm::params::https_listener_enable
  $local_account_token_filter_policy_enable = $winrm::params::local_account_token_filter_policy_enable
  $skip_network_profile_check               = $winrm::params::skip_network_profile_check

  contain winrm::config::allow_unencrypted
  contain winrm::config::ps_remoting
  contain winrm::config::execution_policy
  contain winrm::config::localaccounttokenfilter
  contain winrm::config::auth
  contain winrm::config::lisener:http
  contain winrm::config::lisener:https
  contain winrm::config::firewall

  Class['winrm::config::allow_unencrypted']
  ~> Class['winrm::config::ps_remoting']
  ~> Class['winrm::config::execution_policy']
  ~> Class['winrm::config::localaccounttokenfilter']
  ~> Class['winrm::config::auth']
  ~> Class['winrm::config::lisener:http']
  ~> Class['winrm::config::lisener:https']
  ~> Class['winrm::config::firewall']
}
