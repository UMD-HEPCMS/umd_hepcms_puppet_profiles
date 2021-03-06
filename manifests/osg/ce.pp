class profile::osg::ce {

  include osg::cacerts
    
   user { 'tomcat':
    ensure     => 'present',
    name       => 'tomcat',
    gid        => tomcat,
    home       => '/home/tomcat', # wherever package puts $HOME for user
    shell      => '/bin/true', # /bin/bash or /sbin/nologin
    system     => true,
    comment    => 'tomcat user for CE',
    managehome => false,
    forcelocal => true
  }
  
  group { 'tomcat':
    ensure => 'present',
    name   => 'tomcat',
    system => true,
    forcelocal => true
  }
  
  user { 'rsv':
    ensure     => 'present',
    name       => 'rsv',
    gid        => 100,
    home       => '/home/rsv', # wherever package puts $HOME for user
    shell      => '/bin/bash', # /bin/bash or /sbin/nologin
    managehome => false,
    forcelocal => false
  }
# in old system, rsv was part of users and that was fine
#    group { 'rsv':
#     ensure => 'present',
#     name   => 'rsv',
#     system => true,
#     forcelocal => true
#   }
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
