# == Class: profile::base
class profile::base inherits profile::params {

  class { 'dnsclient':
    nameservers => $profile::params::nameservers,
  }

  class { 'firewall': }
  class { 'iptables': }

  include puppet

}
