# == Class: winrm
#
# This will configure and manage winrm and its configration for remote access
# to Windows systems
#
# === Parameters
#
# [*allow_unencrypted_enable*]
#   Is unencrypted traffic allowed? Default is false.
#
# [*auth_basic_enable*]
#   Is Basic Authentication allowed? Default is false
#
# [*auth_credssp_enable*]
#   Is CredSSP Authentication allowed? Default is false
#
# [*auth_kerberos_enable*]
#  Is Kerberos Authentication allowed? Default is true
#
# [*auth_negotiate_enable*]
#  Is Negotiate Authentication allowed? Default is true
#
# [*certificate_hash*]
#  If not using a Self Signed Certificate then this hash can be passed in
#  and used for the HTTPs/SSL listener
#
# [*cert_validity_days*]
#  Length of time in days the Self Signed certificate is good for. Default is 1095
#
# [*execution_policy*]
#  Server execution policy to follow.
#  Available options are: 'AllSigned', 'Bypass', 'RemoteSigned', 'Restricted', 'Undefined', 'Unrestricted'
#  Defualt is RemoteSigned
#
# [*http_listener_enable*]
#  Should winrm be listening for http connections. Defialt is false
#
# [*https_listener_enable*]
#  Should winrm be listening for https connections. Defialt is true
#
# [*local_account_token_filter_policy_enable*]
#  If LocalAccountTokenFilterPolicy should be enabled? Default is true
#
# [*skip_network_profile_check*]
#  If Enable-PSRemoting should skip the network profile check. Default is false
#
class winrm (
  Boolean  $allow_unencrypted_enable                 = $winrm::params::allow_unencrypted_enable,
  Boolean  $auth_basic_enable                        = $winrm::params::auth_basic_enable,
  Boolean  $auth_credssp_enable                      = $winrm::params::auth_credssp_enable,
  Boolean  $auth_kerberos_enable                     = $winrm::params::auth_kerberos_enable,
  Boolean  $auth_negotiate_enable                    = $winrm::params::auth_negotiate_enable,
  String   $certificate_hash                         = $winrm::params::certificate_hash,
  Integer  $cert_validity_days                       = $winrm::params::cert_validity_days,
  Enum['AllSigned', 'Bypass', 'RemoteSigned', 'Restricted', 'Undefined', 'Unrestricted']
    $execution_policy                                = $winrm::params::execution_policy,
  Boolean  $http_listener_enable                     = $winrm::params::http_listener_enable,
  Boolean  $https_listener_enable                    = $winrm::params::https_listener_enable,
  Boolean  $local_account_token_filter_policy_enable = $winrm::params::local_account_token_filter_policy_enable,
  Boolean  $skip_network_profile_check               = $winrm::params::skip_network_profile_check,
) inherits winrm::params {
  contain winrm::service
  contain winrm::config

  Class['winrm::service']
  ~> Class['winrm::config']

}
