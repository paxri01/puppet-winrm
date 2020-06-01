# https://forge.puppet.com/puppet/windows_firewall
class winrm::config::firewall (
  Boolean $http_listener_enable = $winrm::http_listener_enable,
  Boolean $https_listener_enable = $winrm::https_listener_enable,
) {
  if $http_listener_enable {
    windows_firewall::exception { 'WINRM HTTP':
      ensure       => present,
      direction    => 'in',
      action       => 'allow',
      enabled      => true,
      protocol     => 'TCP',
      local_port   => 5985,
      remote_port  => 'any',
      display_name => 'Windows Remote Management HTTP-In',
      description  => 'Inbound rule for Windows Remote Management via WS-Management. [TCP 5985]',
    }
  }

  if $https_listener_enable {
    windows_firewall::exception { 'WINRM HTTPS':
      ensure       => present,
      direction    => 'in',
      action       => 'allow',
      enabled      => true,
      protocol     => 'TCP',
      local_port   => 5986,
      remote_port  => 'any',
      display_name => 'Windows Remote Management HTTPS-In',
      description  => 'Inbound rule for Windows Remote Management via WS-Management. [TCP 5986]',
    }
  }

}
