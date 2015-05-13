# == Class: profile::foreman
class profile::foreman inherits profile::params {

  include ::epel

  package { 'centos-release-SCL':
    ensure => 'installed',
  }

  class { '::foreman':
    configure_epel_repo => false,
    configure_scl_repo  => false,
    db_manage           => true,
    db_type             => 'mysql',
    require             => [ Package['centos-release-SCL'], Class['epel'] ]
  }

  firewall { '100 allow HTTP':
    chain  => 'INPUT',
    port   => '80',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '100 allow HTTPS':
    chain  => 'INPUT',
    port   => '443',
    proto  => 'tcp',
    action => 'accept',
  }

}
