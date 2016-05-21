# == Class: profile::osg::ce::install
class profile::osg::ce::install {

  #include ::osg::ce
  include profile::osg 
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
