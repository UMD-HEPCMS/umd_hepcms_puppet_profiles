# == Class: profile::ovirt::configure
class profile::ovirt::configure inherits profile::params {
### copied a lot from the base.pp
  # Define globals 
  Firewall {
    before  => Class['iptables::post'],
    require => Class['iptables::pre'],
  }
  Exec { path => ['/bin/', '/usr/bin/', '/usr/sbin/' ] }
# add in firewall rules resource (11 Aug 2015)  
$firewall_rules = hiera_hash('firewall_rules', {})
create_resources('firewall', $firewall_rules)

  filebucket { 'main':
    server => $profile::params::puppetmaster,
    path   => false,
  }

  File { backup => 'main' }
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
  include epel
  include firewall
  include iptables
  include ntp
  include sudo

  # clustershell library
  include ::clustershell 
  # Modules only applied to systems based on facts - these determinations are done by the module
  include omsa
  $extra_packages = hiera_array('extra_packages', [])
  ensure_packages($extra_packages)
  
  $cron_jobs = hiera_hash('cron::jobs', undef)
#  create_resources('cron',$cron_jobs)  
  class { '::timezone':
    timezone => 'America/New_York',
  }

  sudo::conf { 'wheel':
    priority => '10',
    content  => '%wheel ALL=(ALL) ALL'
  }
#  hiera_include('classes')
### If NetworkManager is running it will screw up /etc/resolv.conf
service { 'NetworkManager': ensure => 'stopped', enable => false }
## turn off yum auto updates
class { 'yum_cron':
  yum_autoupdate_ensure => 'absent'
}
}
    
