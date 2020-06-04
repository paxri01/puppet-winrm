# === Parameter defaults
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
class winrm::params {
  $allow_unencrypted_enable = false
  $auth_basic_enable = false
  $auth_credssp_enable = false
  $auth_kerberos_enable = true
  $auth_negotiate_enable = true
  $certificate_hash = ''
  $cert_validity_days = 1095
  $execution_policy = 'RemoteSigned'
  $http_listener_enable = false
  $https_listener_enable = true
  $local_account_token_filter_policy_enable = true
  $skip_network_profile_check = false
}
