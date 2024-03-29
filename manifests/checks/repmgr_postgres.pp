#
# use this to add repmgr-postgres check to molly-guard
#
# @param destination
#   directory where to put the check (mandatory)
# @param check_name
#   name of the check (defaults to $title)
# @param sort
#   sort parameter (defaults to '20')
# @param owner
#   owner of the check (file), defaults to 'root'
# @param group
#   group of the check (file), defaults to 'root'
# @param mode
#   mode of the check (file), defaults to '0755'
#
define mollyguard::checks::repmgr_postgres (
  String  $destination,
  String  $check_name  = $title,
  String  $sort        = '20',
  String  $owner       = 'root',
  String  $group       = 'root',
  String  $mode        = '0755',
) {
  file { "${destination}/${sort}-${check_name}":
    ensure  => 'file',
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => epp('mollyguard/checks/check-repmgr-postgres.epp', {}),
  }
}
