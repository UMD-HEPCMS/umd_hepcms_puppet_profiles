# == Class: profile::dhcp::server
class profile::dhcp::server inherits profile::params {

  class { '::dhcp':
    interfaces  => [
      $profile::params::internal_interface,
    ],
    nameservers => $profile::params::nameservers,
  }

  $dhcp_hosts = hiera('dhcp_hosts', {})
  create_resources('dhcp::host', $dhcp_hosts)

  dhcp::pool { 'internal':
    network => $profile::params::internal_network,
    mask    => $profile::params::internal_network_mask,
    range   => $profile::params::internal_dhcp_range,
    gateway => $profile::params::internal_network_gateway,
  }

  firewall { '100 allow internal dhcp':
    chain   => 'INPUT',
    port    => '67-68',
    proto   => 'udp',
    action  => 'accept',
    iniface => $profile::params::internal_interface,
    source  => $profile::params::internal_subnet,
  }

}
