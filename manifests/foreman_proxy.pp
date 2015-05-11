# == Class: profile::base
class profile::foreman_proxy inherits profile::params {

  include ::sudo

  class { '::foreman_proxy':
    dhcp_managed    => false,
    dns_managed     => false,
    manage_sudoersd => false,
  }

  firewall { '100 allow foreman-proxy':
    chain  => 'INPUT',
    port   => '8443',
    proto  => 'tcp',
    action => 'accept',
  }

}
