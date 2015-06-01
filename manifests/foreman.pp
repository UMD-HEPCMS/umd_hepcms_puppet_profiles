# == Class: profile::foreman
class profile::foreman inherits profile::params {

  include ::epel

  package { 'yum-conf-softwarecollections':
    ensure   => 'installed',
    source   => 'http://ftp.scientificlinux.org/linux/scientific/6x/external_products/softwarecollections/yum-conf-softwarecollections-1.0-1.el6.noarch.rpm',
    provider => 'rpm',
  }

  class { '::foreman':
    configure_epel_repo => false,
    configure_scl_repo  => false,
    db_manage           => true,
    db_type             => 'mysql',
    require             => [ Package['yum-conf-softwarecollections'], Class['epel'] ]
  }

  include ::foreman::compute::ovirt
  include ::foreman::plugin::templates

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
