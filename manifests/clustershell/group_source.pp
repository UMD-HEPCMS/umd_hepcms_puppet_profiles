# See README.md for details
define profile::clustershell::group_source (
  $map,
  $ensure   = 'present',
  $all      = 'UNSET',
  $list     = 'UNSET',
  $reverse  = 'UNSET',
) {

  include profile::clustershell

  $path = "${profile::clustershell::groups_dir}/${name}.conf"

  file { "profile::clustershell::group_source ${name}":
    ensure  => $ensure,
    path    => $path,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('clustershell/group_source.conf.erb'),
    require => File['/etc/clustershell/groups.conf.d'],
  }

}
