# == Class: profile::params
class profile::params {

  # Internal network
  $internal_interface       = hiera('internal_interface', 'eth0')
  $internal_network         = hiera('internal_network', '10.0.0.0')
  $internal_network_mask    = hiera('internal_network_mask', '255.255.255.0')
  $internal_network_gateway = hiera('internal_network_gateway', '10.0.0.1')
  $internal_subnet          = hiera('internal_subnet', "${internal_network}/${internal_network_mask}")

  $internal_dhcp_range      = hiera('internal_dhcp_range', '')

  $public_interface         = hiera('public_interface', 'eth1')

  $_nameservers             = hiera('nameservers', 'UNSET')
  # Workaround since undef can't be a default of hiera lookup
  if $_nameservers == 'UNSET' {
    $nameservers = undef
  } else {
    $nameservers = $_nameservers
  }

  $puppetmaster = hiera('puppet::puppetmaster', "puppet.${::domain}")

}
