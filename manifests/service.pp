# Author::    Liam Bennett (mailto:lbennett@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class winrm::service
#
# This class is meant to be called from `winrm`
# It ensure the service is running
#
class winrm::service {

  assert_private()

  service { 'WinRM':
    ensure => running,
    # Sets startup type to 'Automatic'
    enable => true,
  }
}
