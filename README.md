# WinRM module for Puppet

[![Build Status](https://travis-ci.org/EncoreTechnologies/puppet-winrm.svg?branch=master)](https://travis-ci.org/EncoreTechnologies/puppet-winrm)
[![Puppet Forge Version](https://img.shields.io/puppetforge/v/encore/winrm.svg)](https://forge.puppet.com/encore/winrm)
[![Puppet Forge Downloads](https://img.shields.io/puppetforge/dt/encore/winrm.svg)](https://forge.puppet.com/encore/winrm)
[![Puppet Forge Score](https://img.shields.io/puppetforge/f/encore/winrm.svg)](https://forge.puppet.com/encore/winrm)
[![Puppet PDK Version](https://img.shields.io/puppetforge/pdk-version/encore/winrm.svg)](https://forge.puppet.com/encore/winrm)
[![puppetmodule.info docs](http://www.puppetmodule.info/images/badge.png)](http://www.puppetmodule.info/m/encore-winrm)

#### Table of Contents

1. [Description - What the module does and why it is useful](#module-description)
1. [Setup - The basics of getting started with winrm](#setup-requirements)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - Parameters and explanations](#reference)

## Module Description

This module configures and maintains the WinRM configurations on a Windows system.

## Setup requirements

You need to be running powershell 4 or greater for this module to work correctly.

## Usage

Basic usage:
```puppet
class { 'winrm': }
```

Advanced configuration WinRM on Windows servers:
```puppet
class { 'winrm':
  allow_unencrypted_enable                 => false,
  auth_basic_enable                        => false,
  auth_credssp_enable                      => false,
  auth_kerberos_enable                     => true,
  auth_negotiate_enable                    => true,
  cert_validity_days                       => 1095,
  execution_policy                         => 'RemoteSigned',
  http_listener_enable                     => false,
  https_listener_enable                    => true,
  local_account_token_filter_policy_enable => true,
  skip_network_profile_check               => false,
}
```

Firewall usage:
```puppet
class { 'winrm::config::firewall':
  http_listener_enable  => false,
  https_listener_enable => true,
}
```

## Reference

### Parameters

#### allow_unencrypted_enable

Is unencrypted traffic allowed? Default is false.
```puppet
class { 'winrm::config::allow_unencrypted':
  allow_unencrypted_enable => false,
}
```

#### Auth

##### auth_basic_enable

Is Basic Authentication allowed? Default is false

##### auth_credssp_enable

Is CredSSP Authentication allowed? Default is false

##### auth_kerberos_enable

Is Kerberos Authentication allowed? Default is true

##### auth_negotiate_enable

Is Negotiate Authentication allowed? Default is true

```puppet
class { 'winrm::config::auth':
  auth_basic_enable     => false,
  auth_credssp_enable   => false,
  auth_kerberos_enable  => true,
  auth_negotiate_enable => true,
}
```

#### execution_policy

Server execution policy to follow.
Available options are: 'AllSigned', 'Bypass', 'RemoteSigned', 'Restricted', 'Undefined', 'Unrestricted'
Defualt is RemoteSigned
```puppet
class { 'winrm::config::execution_policy':
  execution_policy => 'RemoteSigned',
}
```

#### http_listener_enable

Should winrm be listening for http connections. Defialt is false
```puppet
class { 'winrm::config::listener::http':
  http_listener_enable => false,
}
```

#### https_listener_enable

Should winrm be listening for https connections. Defialt is true

#### certificate_hash

If not using a Self Signed Certificate then this hash can be passed in
and used for the HTTPs/SSL listener

#### cert_validity_days

```puppet
class { 'winrm::config::listener::https':
  cert_validity_days    => 1095,
  certificate_hash      => 'test cert hash',
  https_listener_enable => true,
}
```

Length of time in days the Self Signed certificate is good for. Default is 1095

#### local_account_token_filter_policy_enable

If LocalAccountTokenFilterPolicy should be enabled? Default is true
```puppet
class { 'winrm::config::localaccounttokenfilter':
  local_account_token_filter_policy_enable => true,
}
```

#### skip_network_profile_check

If Enable-PSRemoting should skip the network profile check. Default is false
```puppet
class { 'winrm::config::ps_remoting':
  skip_network_profile_check => false,
}
```
