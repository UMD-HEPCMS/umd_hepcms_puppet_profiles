# == Class: profile::nfs::client
class profile::nfs::client inherits profile::params {

  class { 'profile::nfs':
    server           => false,
    firewall_iniface => $profile::params::internal_interface,
    firewall_source  => $profile::params::internal_subnet,
  }

}
