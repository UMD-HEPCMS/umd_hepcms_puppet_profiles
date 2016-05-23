# == Class: profile::osg::ce::install
class osg::ce::install {

  include profile::osg
  include profile::osg::ce
  include osg::cacerts
  
  # installation puppet file for CE 
  # packages:
  # condor
  # osg-ce/htcondor
  
  package { 'condor':
    ensure => 'present',
	before => Package['condor-ce'],
  }
  package { 'condor-ce':
    ensure => 'present',
	name => 'condor-ce',
  }

}
