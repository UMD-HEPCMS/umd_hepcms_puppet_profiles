# == Class: profile::osg::gridftp
class profile::osg::gridftp {

  include ::osg::gridftp
  
  # ensure that osg-se-hadoo-client is installed
  package { 'osg-se-hadoop-client':
    ensure  => 'installed',
    require => Yumrepo['osg'], # If the package comes from OSG repos, then may also want to include OSG class 
  }
   package { 'osg-gridftp':
    ensure  => 'present',
  }
  
  # ensure the globus-gridftp-server starts
   service { 'globus-gridftp-server':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true, # TODO: status does not work!
    hasrestart => true,
  }
  
  
}
