# == Class: profile::base
class profile::base inherits profile::params {

  # Define globals
  Firewall {
    before  => Class['iptables::post'],
    require => Class['iptables::pre'],
  }

  filebucket { 'main':
    server => $profile::params::puppetmaster,
    path   => false,
  }

  File { backup => 'main' }

  # Fix deprecation warnings for Puppet >= 3.6.1
  #Package {
  #     allow_virtual => true,
  #}

  # Apply all yumrepo resources before packages
  Yumrepo <| |> -> Package <| |>

  # Define classes
  class { 'dnsclient':
    search      => [
      $profile::params::internal_domain,
      $profile::params::external_domain,
    ],
    domain      => $profile::params::domain,
    nameservers => $profile::params::internal_nameservers,
  }

  include epel
  include firewall
  include iptables
  include ntp
  include sudo

  # Modules only applied to systems based on facts - these determinations are done by the module
  include omsa
  include ovirt::guest
  
  $extra_packages = hiera_array('extra_packages', [])
  ensure_packages($extra_packages)

  class { '::timezone':
    timezone => 'America/New_York',
  }
  
  sudo::conf { 'wheel':
    priority => '10',
    content  => '%wheel ALL=(ALL) ALL'
  }

}
