# @summary Configures the execution policy allowed on the system
#          https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7
class winrm::config::execution_policy (
  String $execution_policy = $winrm::execution_policy,
) {
  exec { 'Set-Execution-Policy':
    command  => "Set-ExecutionPolicy -ExecutionPolicy ${execution_policy} -Scope LocalMachine -Force",
    unless   => "If ((Get-ExecutionPolicy -Scope LocalMachine) -ne '${execution_policy}') { exit 1 }",
    provider => powershell,
  }
}
