# == Class: profile::osg::cefiles::install
class profile::osg::cefiles::install {

 
  include osg::cacerts
  
  
  package { 'condor':
    ensure => 'present',
	before => Package['osg-ce-condor'],
  }
  package { 'osg-ce-condor':
    ensure => 'present',
	name => 'osg-ce-condor',
  }

}
