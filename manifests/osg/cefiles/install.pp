# == Class: profile::osg::cefiles::install
class profile::osg::cefiles::install {

 
  include osg::cacerts
  
  # Installing Condor Package, Ensure that it is present
  package { 'condor':
    ensure => 'present',
	before => Package['osg-ce-condor'],
  }
  # HTCondorCE Package
  package { 'osg-ce-condor':
    ensure => 'present',
	name => 'osg-ce-condor',
  }

}
