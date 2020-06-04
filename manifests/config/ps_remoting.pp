# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/enable-psremoting?view=powershell-7
class winrm::config::ps_remoting (
  Boolean $skip_network_profile_check = $winrm::skip_network_profile_check,
) {
  if $skip_network_profile_check {
    $ps_remoting_cmd = 'Enable-PSRemoting -SkipNetworkProfileCheck -Force -ErrorAction Stop'
  } else {
    $ps_remoting_cmd = 'Enable-PSRemoting -Force -ErrorAction Stop'
  }

  exec { 'Enable-PSRemoting':
    command  => 'Enable-PSRemoting -Force -ErrorAction Stop',
    unless   => 'If (!(Get-PSSessionConfiguration -Verbose:$false) -or (!(Get-ChildItem WSMan:\localhost\Listener))) { exit 1 }',
    provider => powershell,
  }
}
