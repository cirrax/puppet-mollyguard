# molly-guard puppet module

[![Build Status](https://travis-ci.org/cirrax/puppet-mollyguard.svg?branch=master)](https://travis-ci.org/cirrax/puppet-mollyguard)
[![Puppet Forge](https://img.shields.io/puppetforge/v/cirrax/mollyguard.svg?style=flat-square)](https://forge.puppetlabs.com/cirrax/mollyguard)
[![Puppet Forge](https://img.shields.io/puppetforge/dt/cirrax/mollyguard.svg?style=flat-square)](https://forge.puppet.com/cirrax/mollyguard)
[![Puppet Forge](https://img.shields.io/puppetforge/e/cirrax/mollyguard.svg?style=flat-square)](https://forge.puppet.com/cirrax/mollyguard)
[![Puppet Forge](https://img.shields.io/puppetforge/f/cirrax/mollyguard.svg?style=flat-square)](https://forge.puppet.com/cirrax/mollyguard)

#### Table of Contents

1. [Overview](#overview)
1. [Usage](#usage)
1. [Reference](#reference)
1. [Contribuiting](#contributing)


## Overview

This module is used to configure molly-guard, which protects machines from accidental shutdowns/reboots

## Usage

To start using molly-guard you need to include the mollyguard.

A minimal example might be:

~~~
class{'mollyguard'}

~~~

Several defines can be used to add additional checks to run before reboot.

## Reference
Find documentation about possible parameters on top of each manifest and in the 
REFERENCE.md file.

### classes
#### mollyguard
The main class to install mollyguard

### defined types
#### mollyguard::check::ceph
a define to add an additional check if a ceph cluster is healthy

#### mollyguard::check::drbd
a define to add an additional check if all drbd resources are in sync

#### mollyguard::check::libvirt
a define to add an additional check if no libvirt VM's are running

## Contributing

Please report bugs and feature request using GitHub issue tracker.

For pull requests, it is very much appreciated to check your Puppet manifest with puppet-lint
and the available spec tests  in order to follow the recommended Puppet style guidelines
from the Puppet Labs style guide.

### Authors

This module is mainly written by [Cirrax GmbH](https://cirrax.com).

See the [list of contributors](https://github.com/cirrax/puppet-mollyguard/graphs/contributors)
for a list of all contributors.
