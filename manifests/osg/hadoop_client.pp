# manifests/osg/hadoop_client.pp
class profile::osg::hadoop_client {
  $hdfs_uid = hiera('hdfs_uid', '1100') 
  $hdfs_gid = hiera('hdfs_gid', '480')

  include ::osg # only if package comes from OSG repos, ensures the "require" for package will work.

  user { 'hdfs':
    ensure     => 'present',
    name       => 'hdfs',
    uid        => $hdfs_uid,
    gid        => hadoop,
    home       => '/home/hdfs', # wherever package puts $HOME for user
    shell      => '/bin/bash', # /bin/bash or /sbin/nologin
    system     => true,
    comment    => 'hdfs user synchronized across all systems',
    managehome => false,
    before     => Package['osg-se-hadoop-client'],
    forcelocal => true
  }

  group { 'hadoop':
    ensure => 'present',
    name   => 'hadoop',
    gid    => $hdfs_gid,
    system => true,
    forcelocal => true
  }

  package { 'osg-se-hadoop-client':
    ensure  => 'installed',
    require => Yumrepo['osg'], # If the package comes from OSG repos, then may also want to include OSG class 
  }
}