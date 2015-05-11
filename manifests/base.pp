# == Class: profile::base
class profile::base inherits profile::params {

  class { 'dnsclient':
    nameservers => $profile::params::nameservers,
  }

  include epel
  include firewall
  include iptables
  include puppet

}
