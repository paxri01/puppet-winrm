# @summary Configures the execution policy allowed on the system
#          https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7
#
# @param [String] execution_policy
#  Server execution policy to follow.
#  Available options are: 'AllSigned', 'Bypass', 'RemoteSigned', 'Restricted', 'Undefined', 'Unrestricted'
#  Defualt is RemoteSigned
#
# @example Usage:
#   class { 'winrm::config::execution_policy':
#     execution_policy => 'RemoteSigned',
#   }
#
class winrm::config::execution_policy (
  String $execution_policy = $winrm::execution_policy,
) {
  exec { 'Set-Execution-Policy':
    command  => "Set-ExecutionPolicy -ExecutionPolicy ${execution_policy} -Scope LocalMachine -Force",
    unless   => "If ((Get-ExecutionPolicy -Scope LocalMachine) -ne '${execution_policy}') { exit 1 }",
    provider => powershell,
  }
}
