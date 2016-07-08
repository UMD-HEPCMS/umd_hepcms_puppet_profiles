# == Class: profile::osg::se
class profile::osg::sefiles::service {
service { 'bestman2':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
