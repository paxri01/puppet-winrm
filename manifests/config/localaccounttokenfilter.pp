# https://support.microsoft.com/en-us/help/951016/description-of-user-account-control-and-remote-restrictions-in-windows
class winrm::config::localaccounttokenfilter (
  Boolean $policy_enable = $winrm::local_account_token_filter_policy_enable,
) {
  if $policy_enable {
    $policy_value = '1'
  } else {
    $policy_value = '0'
  }

  registry_value { 'LocalAccountTokenFilterPolicy':
      ensure => present,
      path   => 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\LocalAccountTokenFilterPolicy',
      type   => 'dword',
      data   => $policy_value,
    }
}
