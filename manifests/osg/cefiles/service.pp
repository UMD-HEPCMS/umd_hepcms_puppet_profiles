# == Class: profile::osg::ce::service
class profile::osg::cefiles::service {

  #include ::osg::ce
  include ::profile::osg 
  include osg::cacerts
  
  # Service class for Compute Element
  
  # services require to ensure they are enabled
  # condor and condor-ce 
  
  
  service {'condor':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }
  
  service { 'condor-ce':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }
  
  
  

}
