# https://www.windows-security.org/b39e2859968e78097aed08388fdf7a01/allow-unencrypted-traffic
class winrm::config::allow_unencrypted (
  Boolean $allow_unencrypted_enable = $winrm::allow_unencrypted_enable,
) {
  if $allow_unencrypted_enable {
    exec { 'Allow-Unencrypted-Traffic':
      command   => 'Set-Item -Path "WSMan:\localhost\Service\AllowUnencrypted" -Value $true',
      unless    => 'If ((Get-ChildItem WSMan:\localhost\Service\AllowUnencrypted).Value -ne $true) { exit 1 }',
      provider  => powershell,
    }
  } else {
    exec { 'Block-Unencrypted-Traffic':
      command   => 'Set-Item -Path "WSMan:\localhost\Service\AllowUnencrypted" -Value $false',
      unless    => 'If ((Get-ChildItem WSMan:\localhost\Service\AllowUnencrypted).Value -ne $false) { exit 1 }',
      provider  => powershell,
    }
  }
}
