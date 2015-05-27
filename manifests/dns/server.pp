# == Class: profile::dns::server
class profile::dns::server inherits profile::params {

  include profile::foreman_proxy

  Class['dns'] -> Class['foreman_proxy']


  class { '::dns':
    forwarders => $profile::params::external_nameservers,
  }

  $dns_zones = hiera('dns_zones', {})
  create_resources('dns::zone', $dns_zones)

  shellvar { 'bind dns disable ipv6':
    ensure   => 'present',
    target   => '/etc/sysconfig/named',
    variable => 'OPTIONS',
    value    => '-4',
    require  => Package['dns'],
    notify   => Service['named'],
  }

  firewall { '100 allow internal named UDP':
    chain   => 'INPUT',
    port    => '53',
    proto   => 'udp',
    action  => 'accept',
    iniface => $profile::params::internal_interface,
    source  => $profile::params::internal_subnet,
  }

  firewall { '100 allow internal named TCP':
    chain   => 'INPUT',
    port    => '53',
    proto   => 'tcp',
    action  => 'accept',
    iniface => $profile::params::internal_interface,
    source  => $profile::params::internal_subnet,
  }

}
