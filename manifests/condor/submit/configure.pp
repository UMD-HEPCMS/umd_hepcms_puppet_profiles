# configure class for Condor Submit INT
class profile::condor::submit::configure {

file { '/etc/condor/config.d':
  ensure => 'directory',
}

file { '/etc/condor/config.d/local.conf':
   ensure => file,
   content => "DAEMON_LIST = MASTER, SCHEDD",
}

file { '/etc/condor/config.d/cluster.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/cluster.conf',
    require => File['/etc/condor/config.d/'],
  }
   
}
