# == Class: profile::puppet::server
class profile::puppet::server inherits profile::params {

  include profile::base
  include ::r10K

  class { '::puppet':
    agent                      => true,
    server                     => true,
    server_implementation      => 'puppetserver',
    server_common_modules_path => ['/etc/puppet/modules', '/usr/share/puppet/modules'],
  }

  file { '/etc/hiera.yaml':
    ensure => 'symlink',
    target => $::puppet::hiera_config,
  }

  firewall { '100 allow puppetmaster':
    chain  => 'INPUT',
    port   => '8140',
    proto  => 'tcp',
    action => 'accept',
  }

}
