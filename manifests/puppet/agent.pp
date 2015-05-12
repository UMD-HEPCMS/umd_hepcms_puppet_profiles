# == Class: profile::puppet::agent
class profile::puppet::agent inherits profile::params {

  class { '::puppet':
    agent  => true,
    server => false,
  }

}
