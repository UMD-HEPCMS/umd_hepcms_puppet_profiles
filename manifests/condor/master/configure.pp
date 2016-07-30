# configure class for Condor master nodes
class profile::condor::master::configure {

file { '/etc/condor/config.d':
  ensure => 'directory',
}

file { '/etc/condor/config.d/cluster.conf':
    ensure  => 'file',
    content => "DAEMON_LIST = MASTER, COLLECTOR, NEGOTIATOR, SCHEDD",
}
/*
file { '/etc/condor/config.d/local.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor-worker/local.conf',
    require => File['/etc/condor/config.d/'],
} 
*/
}
#/etc/condor/condor_config
#/etc/condor/config.d/10-batch_gahp_blahp.config 
#/etc/condor/config.d/cluster.conf
#/etc/condor/config.local
