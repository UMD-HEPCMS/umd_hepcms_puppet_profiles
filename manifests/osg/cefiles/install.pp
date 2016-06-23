# == Class: profile::osg::cefiles::install
class profile::osg::cefiles::install {

 
  include osg::cacerts
  
  # Installing Condor Package, Ensure that it is present
  package { 'condor':
    ensure => 'present',
	before => Package['osg-ce-condor'],
  }
  # HTCondorCE Package
  # https://twiki.opensciencegrid.org/bin/view/Documentation/Release3/InstallHTCondorCE
  package { 'osg-ce-condor':
    ensure => 'present',
	name => 'osg-ce-condor',
  }
  # RSV package for monitoring (doesn't have to be on the same node)
  # https://twiki.opensciencegrid.org/bin/view/Documentation/Release3/InstallRSV
  package { 'rsvr':
    ensure => 'present',
	name => 'rsv',
  }
}
