# == Class: profile::nat
class profile::nat inherits profile::params {

  class { 'profile::iptables::nat':
    outiface => $profile::params::public_interface,
  }

  profile::iptables::forward { 'internal':
    internal          => $profile::params::internal_interface,
    external          => $profile::params::public_interface,
    allow_established => true,
    allow_all         => true,
  }

}
