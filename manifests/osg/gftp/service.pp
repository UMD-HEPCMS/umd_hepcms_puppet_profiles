# == Class: profile::osg::gftp::service
class profile::osg::gftp::service {
  
  # ensure the globus-gridftp-server starts
   service { 'globus-gridftp-server':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true, # TODO: status does not work!
    hasrestart => true,
  }
  
}
