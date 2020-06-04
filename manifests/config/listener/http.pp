# https://docs.microsoft.com/en-us/powershell/module/microsoft.wsman.management/new-wsmaninstance?view=powershell-7
# https://docs.microsoft.com/en-us/powershell/module/microsoft.wsman.management/remove-wsmaninstance?view=powershell-7
class winrm::config::listener::http (
  Boolean $http_listener_enable = $winrm::http_listener_enable,
) {
  if $http_listener_enable {
    exec { 'Enable-HTTP-Listener':
      command  => 'New-WSManInstance -ResourceUri winrm/config/Listener -SelectorSet @{Address="*";Transport="HTTP"}',
      unless   => 'If (!((Get-ChildItem WSMan:\localhost\Listener) | Where {$_.Keys -like "TRANSPORT=HTTP"})) { Exit 1 }',
      provider => powershell,
    }
  } else {
    exec { 'Disable-HTTP-Listener':
      command  => 'Remove-WSManInstance -ResourceUri winrm/config/Listener -SelectorSet @{Address="*";Transport="HTTP"}',
      unless   => 'If (((Get-ChildItem WSMan:\localhost\Listener) | Where {$_.Keys -like "TRANSPORT=HTTP"})) { Exit 1 }',
      provider => powershell,
    }
  }
}
