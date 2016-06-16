# == Class: profile::osg::se
class profile::osg::sefiles::services {
service { 'bestman2':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
