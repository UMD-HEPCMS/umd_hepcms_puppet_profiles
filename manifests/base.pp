# == Class: profile::base
class profile::base inherits profile::params {

  # Define globals 
  Firewall {
    before  => Class['iptables::post'],
    require => Class['iptables::pre'],
  }
# add in firewall rules resource (11 Aug 2015)  
$firewall_rules = hiera_hash('firewall_rules', {})
create_resources('firewall', $firewall_rules)

  filebucket { 'main':
    server => $profile::params::puppetmaster,
    path   => false,
  }

  File { backup => 'main' }

  # Fix deprecation warnings for Puppet >= 3.6.1
  # Package {
  #  allow_virtual => true,
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
include ::facter
include ::puppetlabs_yum
Class['::puppetlabs_yum'] -> Class['::facter']
  include ::selinux
# NIS (nisclient module)
   class{ 'authconfig' :
      passalgo => 'md5',
      nis => true,
      nisdommain => 'nishepcms.privnet',
      nisserver => '10.1.0.1',
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
