
class profile::osg::cefiles::configure {
  
  include osg::cacerts
  
  # Files required will be
  # http cert
  
  file { '/etc/grid-security/http':
    ensure => 'directory',
    owner  => 'tomcat',
    group  => 'tomcat',
    mode   => '0755',
  }
  file { '/etc/grid-security/http/httpcert.pem':
    ensure  => 'file',
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0444',
    source  => 'file:///data/site_conf/certs/httpcert.pem',
    require => File['/etc/grid-security/http'],
  }
  
  file { '/etc/grid-security/http/httpkey.pem':
    ensure  => 'file',
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0400',
    source  => 'file:///data/site_conf/certs/httpkey.pem',
    require => File['/etc/grid-security/http'],
  }
  
  file { '/etc/condor/config.d/00-restart_peaceful.config':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/00-restart_peaceful.config',
    require => File['/etc/condor/config.d/00-restart_peaceful.config'],
  }
  
  file { '/etc/condor/config.d/10-batch_gahp_blahp.config':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/10-batch_gahp_blahp.config',
    require => File['/etc/condor/config.d/10-batch_gahp_blahp.config'],
  }
  
  file { '/etc/condor/config.d/50-condor-ce-defaults.conf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor/50-condor-ce-defaults.conf',
    require => File['/etc/condor/config.d/50-condor-ce-defaults.conf'],
  }
  
  file { '/etc/condor/config.d/99-condor-ce.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/99-condor-ce.conf',
    require => File['/etc/condor/config.d/99-condor-ce.conf'],
  }
  file { '/etc/condor/config.d/99_gratia.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/99_gratia.conf',
    require => File['/etc/condor/config.d/99_gratia.conf'],
  }
  
  file { '/etc/condor/config.d/cluster.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/cluster.conf',
    require => File['/etc/condor/config.d'],
  }
  file { '/etc/condor/config.d/local.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/local.conf',
    require => File['/etc/condor/config.d'],
  }
}
