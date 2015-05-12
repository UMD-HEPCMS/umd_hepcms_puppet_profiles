# == Class: profile::base
class profile::base inherits profile::params {

  # Define globals
  Firewall {
    before  => Class['iptables::post'],
    require => Class['iptables::pre'],
  }

  filebucket { 'main':
    server  => $profile::params::puppetmaster,
    path    => false,
  }

  File { backup => 'main' }

  # Fix deprecation warnings for Puppet >= 3.6.1
  Package {
    allow_virtual => true,
  }

  # Apply all yumrepo resources before packages
  Yumrepo <| |> -> Package <| |>

  # Define classes
  class { 'dnsclient':
    nameservers => $profile::params::nameservers,
  }

  include epel
  include firewall
  include iptables

}
