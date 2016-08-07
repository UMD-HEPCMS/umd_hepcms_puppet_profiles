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
  include nfs
  include augeasproviders_shellvar
  include inifile
### add when you're ready, and ensure it's got the right settings for ovirt extension module
#  include ovirt
### you're going to have to do something about these variables
# class { 'sudo':
#   purge => false,
# }
# class { 'ovirt::engine':
#   admin_password            => '$admin_password',
#   application_mode          => 'virt',
#   config_allinone           => true,
#   local_storage_path        => '/opt/ovirt/data',
#   setup_fqdn                => 'hepcms-ovirt2.privnet',
#   db_password               => '$db_password',
#   manage_firewall           => false,
#   update_firewall           => false,
#   manage_postgresql_server  => true,
#   nfs_config_enabled        => false,
#   run_engine_setup          => false,
#   storage_type              => 'none',
#   enable_reports            => false,
#   storeconfigs_enabled      => false,
# }  
### I think you have to run this to setup the engine by hand by command line, not in here!
# engine-setup --config-append=/var/lib/ovirt-engine/setup/answers/ovirt-engine-setup.conf
### some more setup that ws done by hand on the old ovirt
# class { 'nfs':
#  server          => true,
#  manage_firewall => false,
#  manage_idmapd   => false,
#  exports         => {
#    '/virt/iso'           => [{'host' => '127.0.0.1', 'options' => 'rw,insecure,all_squash,no_subtree_check,anonuid=36,anongid=36'}],
#    '/virt/import_export' => [{'host' => '127.0.0.1', 'options' => 'rw,insecure,all_squash,no_subtree_check,anonuid=36,anongid=36'}],
#  }
#}

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
    
