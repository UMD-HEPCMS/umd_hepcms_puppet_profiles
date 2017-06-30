# == Class: nfs
#
# Base class shared by NFS clients and servers.
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class profile::nfs (
$package_name = $profile::nfs::params::package_name,
$config_path  = $profile::nfs::params::config_path
) inherits profile::nfs::params {

  package { 'nfs':
    ensure  => present,
    name    => $package_name,
    before  => File['/etc/sysconfig/nfs'],
  }

  file { '/etc/sysconfig/nfs':
    ensure  => present,
    path    => $config_path,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
