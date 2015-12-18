# == Class: profile::params
class profile::params {

  # Internal network
  $internal_interface       = hiera('internal_interface', 'eth0')
  $internal_network         = hiera('internal_network', '10.1.0.0')
  $internal_network_mask    = hiera('internal_network_mask', '255.255.0.0')
  $internal_network_gateway = hiera('internal_network_gateway', '10.1.0.1')
  $internal_subnet          = hiera('internal_subnet', "${internal_network}/${internal_network_mask}")

  $internal_dhcp_range      = hiera('internal_dhcp_range', '')

  $public_interface         = hiera('public_interface', 'eth1')

  # DNS
  $domain                   = hiera('domain', 'umd.edu')
  $external_domain          = hiera('external_domain', 'umd.edu')
  $external_nameservers     = hiera_undef('external_nameservers')
  $internal_domain          = hiera('internal_domain', 'privnet')
  $internal_nameservers     = hiera_undef('internal_nameservers')
  # Work around to allow internal_nameservers to be joined with external_nameservers and possibly be undef to
  # avoid hardcoding defaults into this module
  if $internal_nameservers and $external_nameservers {
    $nameservers            = concat($internal_nameservers, $external_nameservers)
  } else {
    $nameservers            = undef
  }

  # Foreman + Puppet
  $foreman_host = hiera_undef('foreman_host')
  $puppetmaster = hiera_undef('puppet::puppetmaster')

  # Hiera
  $hiera_eyaml_key_dir = hiera('hiera_eyaml_key_dir', '/etc/puppet/secure/keys')

  # oVirt
  $ovirt_base_storage_path = hiera('ovirt_base_storage_path', '/opt/ovirt')

}
