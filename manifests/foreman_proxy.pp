# == Class: profile::base
class profile::foreman_proxy inherits profile::params {

  include ::sudo
  include ::foreman_proxy

  Class['sudo'] -> Class['foreman_proxy']

  firewall { '100 allow foreman-proxy':
    chain  => 'INPUT',
    port   => '8443',
    proto  => 'tcp',
    action => 'accept',
  }

}
