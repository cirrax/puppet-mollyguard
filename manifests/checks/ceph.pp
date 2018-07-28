#
# use this to add ceph check to molly-guard
#
# Parameters:
#   $destination
#     directory where to put the check (mandatory)
#   $check_name
#     name of the check (defaults to $title)
#   $sort
#     sort parameter (defaults to '20')
#   $owner
#     owner of the check (file), defaults to 'root'
#   $group
#     group of the check (file), defaults to 'root'
#   $mode
#     mode of the check (file), defaults to '0755'
#
define mollyguard::checks::ceph (
  String  $destination,
  String  $check_name  = $title,
  String  $sort        = '20',
  String  $owner       = 'root',
  String  $group       = 'root',
  String  $mode        = '0755',
) {

  file {"${destination}/${sort}-${check_name}":
    ensure  => 'present',
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => epp('mollyguard/checks/check-ceph.sh', {}),
  }
}
