# == Class: profile::osg::glexec::configure 
class profile::osg::glexec::configure {

file { '/etc/lcmaps.db':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'file:///data/site_conf/glexec/lcmaps.db',
    }

}
