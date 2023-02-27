#
# use this to add check for running libbvirt domains
# to molly-guard
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
# @param options
#   options to add to virsh list command
#   to select listed domains.
#   defaults to '--all'
#   set this to '--state-running --state-paused --state-other'
#   if you do not care about shutdown instances.
#
define mollyguard::checks::libvirt (
  String  $destination,
  String  $check_name = $title,
  String  $sort       = '20',
  String  $owner      = 'root',
  String  $group      = 'root',
  String  $mode       = '0755',
  String  $options    = '--all',
) {
  file { "${destination}/${sort}-${check_name}":
    ensure  => 'file',
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => epp('mollyguard/checks/check-libvirt.sh.epp', { 'options' => $options }),
  }
}
