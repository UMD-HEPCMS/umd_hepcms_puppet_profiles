# == Class: profile::osg::ce::configure
# This file will be used to setup the configurations of the compute element
class profile::osg::ce::configure {

  
  include profile::osg 
  include osg::cacerts
  
  # Files required will be
  # http cert
  
  file { '/etc/grid-security/http':
    ensure => 'directory',
    owner  => 'tomcat',
    group  => 'tomcat',
    mode   => '0755',
  }
  file { '/etc/grid-security/http/httpcert.pem':
    ensure  => 'file',
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0444',
    source  => 'file:///data/site_conf/certs/httpcert.pem',
    require => File['/etc/grid-security/http'],
  }
  
  file { '/etc/grid-security/http/httpkey.pem':
    ensure  => 'file',
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0400',
    source  => 'file:///data/site_conf/certs/httpkey.pem',
    require => File['/etc/grid-security/http'],
  }
  
  
  

}
