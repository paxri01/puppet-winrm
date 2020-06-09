# @summary Configures the use of Powershell remoting
#          https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/enable-psremoting?view=powershell-7
#
# @param [Boolean] skip_network_profile_check
#  If Enable-PSRemoting should skip the network profile check. Default is false
#
# @example Usage:
#   class { 'winrm::config::ps_remoting':
#     skip_network_profile_check => false,
#   }
#
class winrm::config::ps_remoting (
  Boolean $skip_network_profile_check = $winrm::skip_network_profile_check,
) {
  if $skip_network_profile_check {
    $ps_remoting_cmd = 'Enable-PSRemoting -SkipNetworkProfileCheck -Force -ErrorAction Stop'
  } else {
    $ps_remoting_cmd = 'Enable-PSRemoting -Force -ErrorAction Stop'
  }

  exec { 'Enable-PSRemoting':
    command  => $ps_remoting_cmd,
    unless   => 'If (!(Get-PSSessionConfiguration -Verbose:$false) -or (!(Get-ChildItem WSMan:\localhost\Listener))) { exit 1 }',
    provider => powershell,
  }
}
