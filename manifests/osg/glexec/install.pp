# == Class: profile::osg::glexec::install 
class profile::osg::glexec::install {

# ensure that condor-procd is installed
  
  package { 'condor-procd':
    ensure  => 'present',
  }

  package {'osg-wn-client-glexec':
    ensure => 'installed',
  }
}
