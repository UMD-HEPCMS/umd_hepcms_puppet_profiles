class profile::osg::ce {

  include osg::cacerts
    
   user { 'tomcat':
    ensure     => 'present',
    name       => 'tomcat',
    gid        => tomcat,
    home       => '/home/tomcat', # wherever package puts $HOME for user
    shell      => '/bin/bash', # /bin/bash or /sbin/nologin
    system     => true,
    comment    => 'hdfs user synchronized across all systems',
    managehome => false,
    forcelocal => true
  }
  
  group { 'tomcat':
    ensure => 'present',
    name   => 'tomcat',
    system => true,
    forcelocal => true
  }
  
  user { 'condor':
    ensure     => 'present',
    name       => 'condor',
    gid        => condor,
    home       => '/home/condor', # wherever package puts $HOME for user
    shell      => '/bin/bash', # /bin/bash or /sbin/nologin
    system     => true,
    comment    => 'condor user',
    managehome => false,
    forcelocal => true
  }
  
  
}
