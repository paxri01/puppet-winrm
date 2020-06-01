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
