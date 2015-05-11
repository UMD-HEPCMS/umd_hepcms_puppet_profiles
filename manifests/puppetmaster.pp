# == Class: profile::base
class profile::puppetmaster inherits profile::params {

  include ::r10K

  class { '::puppet':
    server => true,
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
