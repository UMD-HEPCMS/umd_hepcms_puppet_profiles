# == Class: profile::puppet::server
class profile::puppet::server inherits profile::params {

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
    #iniface => $profile::params::internal_interface,
    #source  => $profile::params::internal_subnet,
  }

  #TODO: Need a way to install hiera-eyaml into puppetserver via 'puppetserver gem install hiera-eyaml'
  #package { 'hiera-eyaml':
  #  ensure   => 'installed',
  #  provider => 'gem',
  #  before   => Class['puppet'],
  #}

  $hiera_eyaml_key_dirs_dirname = dirname($profile::params::hiera_eyaml_key_dir)
  if ! defined(File[$hiera_eyaml_key_dirs_dirname]) {
    file { $hiera_eyaml_key_dirs_dirname:
      ensure => 'directory',
      owner  => 'puppet',
      group  => 'puppet',
      mode   => '0500',
      before => File[$profile::params::hiera_eyaml_key_dir],
    }
  }

  file { $profile::params::hiera_eyaml_key_dir:
    ensure  => 'directory',
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0500',
    require => Class['puppet::server::install'],
    before  => Class['puppet::server::service'],
  }

  file { "${profile::params::hiera_eyaml_key_dir}/private_key.pkcs7.pem":
    ensure  => 'file',
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0400',
    # DO NOT manage source
    #source  => ,
    require => File[$profile::params::hiera_eyaml_key_dir],
    before  => Class['puppet::server::service'],
  }

  file { "${profile::params::hiera_eyaml_key_dir}/public_key.pkcs7.pem":
    ensure  => 'file',
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0400',
    # DO NOT manage source
    #source  => ,
    require => File[$profile::params::hiera_eyaml_key_dir],
    before  => Class['puppet::server::service'],
  }

}
