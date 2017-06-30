# == Class: profile::nfs::server
class profile::nfs::server inherits profile::params {

  class { 'profile::nfs':
    server           => true,
    firewall_iniface => $profile::params::internal_interface,
    firewall_source  => $profile::params::internal_subnet,
  }

}
