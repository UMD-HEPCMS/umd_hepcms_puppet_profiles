# configure class for Condor worker nodes
class profile::condor::worker::configure {


file { '/etc/condor/config.d':
  ensure => 'directory',
}

file { '/etc/condor/config.d/cluster.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/cluster.conf',
    require => File['/etc/condor-worker/config.d/'],
}
file { '/etc/condor/config.d/local.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/local.conf',
    require => File['/etc/condor-worker/config.d/'],
} 

}
