# configure class for Condor Submit INT
class profile::int_submit::configure {


file { '/etc/condor/config.d':
  ensure => 'directory',
}

file { '/etc/condor/config.d/local.conf':
   ensure => file,
   contents => "DAEMON_LIST = MASTER, SCHEDD",
}

file { '/etc/condor/config.d/cluster.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/cluster.conf',
    require => File['/etc/condor/config.d/'],
  }
   
}
