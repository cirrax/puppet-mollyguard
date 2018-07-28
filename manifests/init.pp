# mollyguard main class
# 
# Parameters:
#   $package_ensure
#     what to ensure for packages, defaults to 'present'
#   $packages
#     Array of packages to install, defaults to ['molly-guard']
#   $checks
#     Hash of additional checks to install, defaults to {}
#
#     Example (hiera):
#       mollyguard::checks:
#         libvirt:
#           options: '--state-running --state-paused --state-other'
#         drbd: {}
#     
#   $check_destination
#     where to put the additional checks, 
#     defaults to '/etc/molly-guard/run.d'
#   $purge_checks      = true,
#     if true (default), we purge checks not managed with puppet
#   $ignore_sys_checks
#     name of checks to ignore purging, these are the default
#     checks installed with the package.
#     defaults to: ['10-print-message', '30-query-hostname']
#
class mollyguard (
  String  $package_ensure    = 'present',
  Array   $packages          = ['molly-guard'],
  Hash    $checks            = {},
  String  $check_destination = '/etc/molly-guard/run.d',
  Boolean $purge_checks      = true,
  Array   $ignore_sys_checks = ['10-print-message', '30-query-hostname'],
){

  package{ $packages:
    ensure => $package_ensure,
    tag    => 'molly-guard-packages',
  }

  $check_defaults = {
    destination => $check_destination,
  }

  if $purge_checks {
    file { $check_destination :
      ensure  => 'directory',
      purge   => true,
      recurse => true,
    }

    # do not remove checks installed from the package
    $_ignore_sys_checks = prefix($ignore_sys_checks, "${check_destination}/")

    file { $_ignore_sys_checks: }
  }

  # create generic resources (eg. to retrieve certificate)
  $checks.each | $res, $vals | {
    create_resources("::mollyguard::checks::${res}", { "${res}" => $vals }, $check_defaults )
  }
}
