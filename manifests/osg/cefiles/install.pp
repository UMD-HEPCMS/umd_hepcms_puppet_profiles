# == Class: profile::osg::cefiles::install
class profile::osg::cefiles::install {

 
  include osg::cacerts
  
  
  package { 'condor':
    ensure => 'present',
	before => Package['condor-ce'],
  }
  package { 'condor-ce':
    ensure => 'present',
	name => 'condor-ce',
  }

}
