# == Class: profile::tftp::server
class profile::tftp::server inherits profile::params {

  include profile::foreman_proxy
  include ::tftp

  Class['tftp'] -> Class['foreman_proxy']

  firewall { '100 allow internal tftp':
    chain   => 'INPUT',
    port    => '69',
    proto   => 'udp',
    action  => 'accept',
    iniface => $profile::params::internal_interface,
    source  => $profile::params::internal_subnet,
  }

}
