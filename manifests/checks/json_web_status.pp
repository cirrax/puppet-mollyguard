#
# @summary check a json status
#
# request a json file from an url
# and check a value
#
# ensure that jq and curl is available on the
# target node.
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
# @param uris
#   array of uris for json files.
#   each json file received will be checked
# @param jqueries
#   array of queries to run on every json
#   for syntax see man jq. The query needs to
#   return 'true' for the check to pass.
#   an examle could be '.numberofmembers|contains(3)'
#   which is true if the json contains a 
#   nuberofmembers equal 3
# @param show_json
#   if we show the json we query (defaults true)
# 
define mollyguard::checks::json_web_status (
  String           $destination,
  String           $check_name = $title,
  String           $sort       = '20',
  String           $owner      = 'root',
  String           $group      = 'root',
  String           $mode       = '0755',
  Array[String[1]] $uris       = [],
  Array[String[1]] $jqueries   = [],
  Boolean          $show_json  = true,
) {
  file { "${destination}/${sort}-${check_name}":
    ensure  => 'file',
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => epp('mollyguard/checks/json_web_status.sh.epp', {
        'uris'      => $uris,
        'jqueries'  => $jqueries,
        'show_json' => $show_json,
    }),
  }
}
