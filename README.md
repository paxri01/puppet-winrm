# WinRM module for Puppet

[![Build Status](https://travis-ci.org/EncoreTechnologies/puppet-winrm.png?branch=master)](https://travis-ci.org/EncoreTechnologies/puppet-winrm)
[![Code Coverage](https://coveralls.io/repos/github/EncoreTechnologies/puppet-winrm/badge.svg?branch=master)](https://coveralls.io/github/EncoreTechnologies/puppet-winrm)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/winrm.svg)](https://forge.puppetlabs.com/puppet/winrm)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/winrm.svg)](https://forge.puppetlabs.com/puppet/winrm)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/winrm.svg)](https://forge.puppetlabs.com/puppet/winrm)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/winrm.svg)](https://forge.puppetlabs.com/puppet/winrm)

#### Table of Contents

1. [Description - What the module does and why it is useful](#module-description)
1. [Setup - The basics of getting started with winrm](#setup)
    * [Setup requirements](#setup-requirements)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - Parameters and explanations](#reference)

## Module Description

This module configures and maintains the WinRM configurations on a Windows system.

## Setup

##Setup requirements

You need to be running powershell 4 or greater for this module to work correctly

## Usage


## Reference

### Parameters

#### allow_unencrypted_enable

Is unencrypted traffic allowed? Default is false.

#### auth_basic_enable

Is Basic Authentication allowed? Default is false

#### auth_credssp_enable

Is CredSSP Authentication allowed? Default is false

#### auth_kerberos_enable

Is Kerberos Authentication allowed? Default is true

#### auth_negotiate_enable

Is Negotiate Authentication allowed? Default is true

#### certificate_hash

If not using a Self Signed Certificate then this hash can be passed in
and used for the HTTPs/SSL listener

#### cert_validity_days

Length of time in days the Self Signed certificate is good for. Default is 1095

#### execution_policy

Server execution policy to follow.
Available options are: 'AllSigned', 'Bypass', 'RemoteSigned', 'Restricted', 'Undefined', 'Unrestricted'
Defualt is RemoteSigned

#### http_listener_enable

Should winrm be listening for http connections. Defialt is false

#### https_listener_enable

Should winrm be listening for https connections. Defialt is true

#### local_account_token_filter_policy_enable

If LocalAccountTokenFilterPolicy should be enabled? Default is true

#### skip_network_profile_check

If Enable-PSRemoting should skip the network profile check. Default is false
