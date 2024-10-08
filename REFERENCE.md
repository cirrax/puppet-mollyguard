# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`mollyguard`](#mollyguard): mollyguard main class

### Defined types

* [`mollyguard::checks::ceph`](#mollyguard--checks--ceph): use this to add ceph check to molly-guard
* [`mollyguard::checks::drbd`](#mollyguard--checks--drbd): use this to add drbd check to molly-guard
* [`mollyguard::checks::libvirt`](#mollyguard--checks--libvirt): use this to add check for running libbvirt domains to molly-guard
* [`mollyguard::checks::rabbitmq`](#mollyguard--checks--rabbitmq): use this to add drbd check to molly-guard
* [`mollyguard::checks::repmgr_postgres`](#mollyguard--checks--repmgr_postgres): use this to add repmgr-postgres check to molly-guard

## Classes

### <a name="mollyguard"></a>`mollyguard`

mollyguard main class

#### Parameters

The following parameters are available in the `mollyguard` class:

* [`package_ensure`](#-mollyguard--package_ensure)
* [`packages`](#-mollyguard--packages)
* [`checks`](#-mollyguard--checks)
* [`check_destination`](#-mollyguard--check_destination)
* [`purge_checks`](#-mollyguard--purge_checks)
* [`ignore_sys_checks`](#-mollyguard--ignore_sys_checks)

##### <a name="-mollyguard--package_ensure"></a>`package_ensure`

Data type: `String`

what to ensure for packages, defaults to 'present'

Default value: `'present'`

##### <a name="-mollyguard--packages"></a>`packages`

Data type: `Array`

Array of packages to install, defaults to ['molly-guard']

Default value: `['molly-guard']`

##### <a name="-mollyguard--checks"></a>`checks`

Data type: `Hash`

Hash of additional checks to install, defaults to {}.
This parameter is hiera hash merged by default.

Example (hiera):
  mollyguard::checks:
    libvirt:
      options: '--state-running --state-paused --state-other'
    drbd: {}

Default value: `{}`

##### <a name="-mollyguard--check_destination"></a>`check_destination`

Data type: `String`

where to put the additional checks,
defaults to '/etc/molly-guard/run.d'

Default value: `'/etc/molly-guard/run.d'`

##### <a name="-mollyguard--purge_checks"></a>`purge_checks`

Data type: `Boolean`

if true (default), we purge checks not managed with puppet

Default value: `true`

##### <a name="-mollyguard--ignore_sys_checks"></a>`ignore_sys_checks`

Data type: `Array`

name of checks to ignore purging, these are the default
checks installed with the package.
defaults to: ['10-print-message', '30-query-hostname']

Default value: `['10-print-message', '30-query-hostname']`

## Defined types

### <a name="mollyguard--checks--ceph"></a>`mollyguard::checks::ceph`

use this to add ceph check to molly-guard

#### Parameters

The following parameters are available in the `mollyguard::checks::ceph` defined type:

* [`destination`](#-mollyguard--checks--ceph--destination)
* [`check_name`](#-mollyguard--checks--ceph--check_name)
* [`sort`](#-mollyguard--checks--ceph--sort)
* [`owner`](#-mollyguard--checks--ceph--owner)
* [`group`](#-mollyguard--checks--ceph--group)
* [`mode`](#-mollyguard--checks--ceph--mode)

##### <a name="-mollyguard--checks--ceph--destination"></a>`destination`

Data type: `String`

directory where to put the check (mandatory)

##### <a name="-mollyguard--checks--ceph--check_name"></a>`check_name`

Data type: `String`

name of the check (defaults to $title)

Default value: `$title`

##### <a name="-mollyguard--checks--ceph--sort"></a>`sort`

Data type: `String`

sort parameter (defaults to '20')

Default value: `'20'`

##### <a name="-mollyguard--checks--ceph--owner"></a>`owner`

Data type: `String`

owner of the check (file), defaults to 'root'

Default value: `'root'`

##### <a name="-mollyguard--checks--ceph--group"></a>`group`

Data type: `String`

group of the check (file), defaults to 'root'

Default value: `'root'`

##### <a name="-mollyguard--checks--ceph--mode"></a>`mode`

Data type: `String`

mode of the check (file), defaults to '0755'

Default value: `'0755'`

### <a name="mollyguard--checks--drbd"></a>`mollyguard::checks::drbd`

use this to add drbd check to molly-guard

#### Parameters

The following parameters are available in the `mollyguard::checks::drbd` defined type:

* [`destination`](#-mollyguard--checks--drbd--destination)
* [`check_name`](#-mollyguard--checks--drbd--check_name)
* [`sort`](#-mollyguard--checks--drbd--sort)
* [`owner`](#-mollyguard--checks--drbd--owner)
* [`group`](#-mollyguard--checks--drbd--group)
* [`mode`](#-mollyguard--checks--drbd--mode)

##### <a name="-mollyguard--checks--drbd--destination"></a>`destination`

Data type: `String`

directory where to put the check (mandatory)

##### <a name="-mollyguard--checks--drbd--check_name"></a>`check_name`

Data type: `String`

name of the check (defaults to $title)

Default value: `$title`

##### <a name="-mollyguard--checks--drbd--sort"></a>`sort`

Data type: `String`

sort parameter (defaults to '20')

Default value: `'20'`

##### <a name="-mollyguard--checks--drbd--owner"></a>`owner`

Data type: `String`

owner of the check (file), defaults to 'root'

Default value: `'root'`

##### <a name="-mollyguard--checks--drbd--group"></a>`group`

Data type: `String`

group of the check (file), defaults to 'root'

Default value: `'root'`

##### <a name="-mollyguard--checks--drbd--mode"></a>`mode`

Data type: `String`

mode of the check (file), defaults to '0755'

Default value: `'0755'`

### <a name="mollyguard--checks--libvirt"></a>`mollyguard::checks::libvirt`

use this to add check for running libbvirt domains
to molly-guard

#### Parameters

The following parameters are available in the `mollyguard::checks::libvirt` defined type:

* [`destination`](#-mollyguard--checks--libvirt--destination)
* [`check_name`](#-mollyguard--checks--libvirt--check_name)
* [`sort`](#-mollyguard--checks--libvirt--sort)
* [`owner`](#-mollyguard--checks--libvirt--owner)
* [`group`](#-mollyguard--checks--libvirt--group)
* [`mode`](#-mollyguard--checks--libvirt--mode)
* [`options`](#-mollyguard--checks--libvirt--options)

##### <a name="-mollyguard--checks--libvirt--destination"></a>`destination`

Data type: `String`

directory where to put the check (mandatory)

##### <a name="-mollyguard--checks--libvirt--check_name"></a>`check_name`

Data type: `String`

name of the check (defaults to $title)

Default value: `$title`

##### <a name="-mollyguard--checks--libvirt--sort"></a>`sort`

Data type: `String`

sort parameter (defaults to '20')

Default value: `'20'`

##### <a name="-mollyguard--checks--libvirt--owner"></a>`owner`

Data type: `String`

owner of the check (file), defaults to 'root'

Default value: `'root'`

##### <a name="-mollyguard--checks--libvirt--group"></a>`group`

Data type: `String`

group of the check (file), defaults to 'root'

Default value: `'root'`

##### <a name="-mollyguard--checks--libvirt--mode"></a>`mode`

Data type: `String`

mode of the check (file), defaults to '0755'

Default value: `'0755'`

##### <a name="-mollyguard--checks--libvirt--options"></a>`options`

Data type: `String`

options to add to virsh list command
to select listed domains.
defaults to '--all'
set this to '--state-running --state-paused --state-other'
if you do not care about shutdown instances.

Default value: `'--all'`

### <a name="mollyguard--checks--rabbitmq"></a>`mollyguard::checks::rabbitmq`

use this to add drbd check to molly-guard

#### Parameters

The following parameters are available in the `mollyguard::checks::rabbitmq` defined type:

* [`destination`](#-mollyguard--checks--rabbitmq--destination)
* [`check_name`](#-mollyguard--checks--rabbitmq--check_name)
* [`sort`](#-mollyguard--checks--rabbitmq--sort)
* [`owner`](#-mollyguard--checks--rabbitmq--owner)
* [`group`](#-mollyguard--checks--rabbitmq--group)
* [`mode`](#-mollyguard--checks--rabbitmq--mode)

##### <a name="-mollyguard--checks--rabbitmq--destination"></a>`destination`

Data type: `String`

directory where to put the check (mandatory)

##### <a name="-mollyguard--checks--rabbitmq--check_name"></a>`check_name`

Data type: `String`

name of the check (defaults to $title)

Default value: `$title`

##### <a name="-mollyguard--checks--rabbitmq--sort"></a>`sort`

Data type: `String`

sort parameter (defaults to '20')

Default value: `'20'`

##### <a name="-mollyguard--checks--rabbitmq--owner"></a>`owner`

Data type: `String`

owner of the check (file), defaults to 'root'

Default value: `'root'`

##### <a name="-mollyguard--checks--rabbitmq--group"></a>`group`

Data type: `String`

group of the check (file), defaults to 'root'

Default value: `'root'`

##### <a name="-mollyguard--checks--rabbitmq--mode"></a>`mode`

Data type: `String`

mode of the check (file), defaults to '0755'

Default value: `'0755'`

### <a name="mollyguard--checks--repmgr_postgres"></a>`mollyguard::checks::repmgr_postgres`

use this to add repmgr-postgres check to molly-guard

#### Parameters

The following parameters are available in the `mollyguard::checks::repmgr_postgres` defined type:

* [`destination`](#-mollyguard--checks--repmgr_postgres--destination)
* [`check_name`](#-mollyguard--checks--repmgr_postgres--check_name)
* [`sort`](#-mollyguard--checks--repmgr_postgres--sort)
* [`owner`](#-mollyguard--checks--repmgr_postgres--owner)
* [`group`](#-mollyguard--checks--repmgr_postgres--group)
* [`mode`](#-mollyguard--checks--repmgr_postgres--mode)

##### <a name="-mollyguard--checks--repmgr_postgres--destination"></a>`destination`

Data type: `String`

directory where to put the check (mandatory)

##### <a name="-mollyguard--checks--repmgr_postgres--check_name"></a>`check_name`

Data type: `String`

name of the check (defaults to $title)

Default value: `$title`

##### <a name="-mollyguard--checks--repmgr_postgres--sort"></a>`sort`

Data type: `String`

sort parameter (defaults to '20')

Default value: `'20'`

##### <a name="-mollyguard--checks--repmgr_postgres--owner"></a>`owner`

Data type: `String`

owner of the check (file), defaults to 'root'

Default value: `'root'`

##### <a name="-mollyguard--checks--repmgr_postgres--group"></a>`group`

Data type: `String`

group of the check (file), defaults to 'root'

Default value: `'root'`

##### <a name="-mollyguard--checks--repmgr_postgres--mode"></a>`mode`

Data type: `String`

mode of the check (file), defaults to '0755'

Default value: `'0755'`

