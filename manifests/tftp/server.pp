# == Class: profile::tftp::server
class profile::tftp::server inherits profile::params {

  include ::tftp

  firewall { '100 allow internal tftp':
    chain   => 'INPUT',
    port    => '69',
    proto   => 'udp',
    action  => 'accept',
    iniface => $profile::params::internal_interface,
    source  => $profile::params::internal_subnet,
  }

}
