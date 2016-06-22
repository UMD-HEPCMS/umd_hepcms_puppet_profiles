# == Class: profile::osg::sefiles::configure
class profile::osg::sefiles::configure  {

  # ensure the grid-security directory exists
  file { '/etc/grid-security':
   ensure => directory,
  }
  # ensure bestman directory exists
  file { '/etc/grid-security/bestman':
   ensure => directory,
  }
  # ensure host cert
  file { '/etc/grid-security/hostcert.pem':
   ensure => file,
   owner => root,
   source  => 'file:///data/site_conf/sefiles/hostcert.pem',
  }
  # ensure hostkey 
  file { '/etc/grid-security/hostkey.pem':
   ensure => file,
   owner => root,
   source  => 'file:///data/site_conf/sefiles/hostkey.pem',
  }
  # ensure this file exists
  file { '/etc/grid-security/bestman/bestmancert.pem':
    ensure  => 'file',
    owner   => 'bestman',
    group   => 'bestman',
    mode    => '0400',
    source  => 'file:///data/site_conf/sefiles/bestman/bestmancert.pem',
    
  }
  # ensure this file exists
  file { '/etc/grid-security/bestman/bestmankey.pem':
    ensure  => 'file',
    owner   => 'bestman',
    group   => 'bestman',
    mode    => '0400',
    source  => 'file:///data/site_conf/sefiles/bestman/bestmankey.pem',
  }
  
  file { '/etc/sysconfig/bestman2':
   ensure  => 'file',
   source  => 'file:///data/site_conf/sefiles/bestman/sysconfig/bestman2',
  }
  file { '/etc/bestman2/conf/bestman2.rc':
   ensure  => 'file',
   source => 'file:///data/site_conf/sefiles/bestman/conf/bestman2.rc',
  }
  file { '/etc/hadoop/conf/hdfs-site.xml':
   ensure  => 'file',
   source => 'file:///data/site_conf/sefiles/hadoop/hdfs-site.xml',
  }
  
  file { '/etc/hadoop/conf/core-site.xml':
   ensure  => 'file',
   source => 'file:///data/site_conf/sefiles/hadoop/core-site.xml',
  }
}
