# == Class: profile::nat
class profile::nat inherits profile::params {

  class { 'iptables::nat':
    outiface => $profile::params::public_interface,
  }

  iptables::forward { 'internal':
    internal          => $profile::params::internal_interface,
    external          => $profile::params::public_interface,
    allow_established => true,
    allow_all         => true,
  }

}
