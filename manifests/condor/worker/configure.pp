# configure class for Condor worker nodes
class profile::condor::worker::configure {


file { '/etc/condor/config.d':
  ensure => 'directory',
}

file { '/etc/condor/config.d/cluster.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor-worker/cluster.conf',
    require => File['/etc/condor/config.d/'],
}
file { '/etc/condor/config.d/local.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor-worker/local.conf',
    require => File['/etc/condor/config.d/'],
} 

}
