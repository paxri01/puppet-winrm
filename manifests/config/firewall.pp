# @summary Configures the firewall to allow or block connections based on the listeners that are enabled.
#          We are using an exec resource here because of issues with windows_firewall module
#          https://forge.puppet.com/puppet/windows_firewall
#
# @param [Boolean] http_listener_enable
#  Should winrm be listening for http connections. Defialt is false
#
# @param [Boolean] https_listener_enable
#  Should winrm be listening for https connections. Defialt is true
#
# @example Usage:
#   class { 'winrm::config::firewall':
#     http_listener_enable  => false,
#     https_listener_enable => true,
#   }
#
class winrm::config::firewall (
  Boolean $http_listener_enable = $winrm::http_listener_enable,
  Boolean $https_listener_enable = $winrm::https_listener_enable,
) {
  exec { 'Configure-Firewall-Rules':
    command  => template('winrm/firewall/firewall_rules.ps1.erb'),
    provider => 'powershell',
    unless   => template('winrm/firewall/firewall_rules_onlyif.ps1.erb'),
  }

  # if $http_listener_enable {
  #  $http_action = 'allow'
  # } else {
  #  $http_action = 'block'
  # }

  # if $https_listener_enable {
  #  $https_action = 'allow'
  # } else {
  #  $https_action = 'block'
  # }

  # windows_firewall::exception { 'WINRM HTTP':
  #  ensure       => present,
  #  direction    => 'in',
  #  action       => $http_action,
  #  enabled      => true,
  #  protocol     => 'TCP',
  #  local_port   => 5985,
  #  remote_port  => 'any',
  #  display_name => 'Windows Remote Management (HTTP-In)',
  #  description  => 'Inbound rule for Windows Remote Management via WS-Management. [TCP 5985]',
  # }

  # windows_firewall::exception { 'WINRM HTTPS':
  #  ensure       => present,
  #  direction    => 'in',
  #  action       => $https_action,
  #  enabled      => true,
  #  protocol     => 'TCP',
  #  local_port   => 5986,
  #  remote_port  => 'any',
  #  display_name => 'Windows Remote Management (HTTPS-In)',
  #  description  => 'Inbound rule for Windows Remote Management via WS-Management. [TCP 5986]',
  # }

}
