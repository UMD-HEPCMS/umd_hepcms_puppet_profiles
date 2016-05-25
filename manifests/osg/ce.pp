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
}
