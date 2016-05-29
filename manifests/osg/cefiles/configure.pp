
class profile::osg::cefiles::configure {
  
  include osg::cacerts
  
  # Files required will be
  # http cert
  
  # ensure /etc/grid-security/http directory exists
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
  
  # ensure condor/config.d exists
  file { '/etc/condor/config.d':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  file { '/etc/condor/config.d/00-restart_peaceful.config':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/00-restart_peaceful.config',
    require => File['/etc/condor/config.d'],
  }
  
  file { '/etc/condor/config.d/10-batch_gahp_blahp.config':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/10-batch_gahp_blahp.config',
    require => File['/etc/condor/config.d'],
  }
  
  file { '/etc/condor/config.d/50-condor-ce-defaults.conf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor/50-condor-ce-defaults.conf',
    require => File['/etc/condor/config.d'],
  }
  
  file { '/etc/condor/config.d/99-condor-ce.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/99-condor-ce.conf',
    require => File['/etc/condor/config.d/'],
  }
  file { '/etc/condor/config.d/99_gratia.conf':
    ensure  => 'file',
    source  => 'file:///data/site_conf/condor/99_gratia.conf',
    require => File['/etc/condor/config.d/'],
  }
  
  file { '/etc/condor/config.d/cluster.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor/cluster.conf',
    require => File['/etc/condor/config.d/'],
  }
  file { '/etc/condor/config.d/local.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor/local.conf',
    require => File['/etc/condor/config.d/'],
  }
  
  # ensure the HTCondorCE Directory exists
    file { '/etc/condor-ce/config.d':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  
  # file HTCondorCE 01-ce-auth.conf
  file { '/etc/condor-ce/config.d/01-ce-auth.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/01-ce-auth.conf',
    require => File['/etc/condor-ce/config.d/'],
  }
  
  # file HTCondorCE 01-ce-router.conf
  file { '/etc/condor-ce/config.d/01-ce-router.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/01-ce-router.conf',
    require => File['/etc/condor-ce/config.d/'],
  }
  
  # file HTCondorCE 01-common-auth.conf
  file { '/etc/condor-ce/config.d/01-common-auth.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/01-common-auth.conf',
    require => File['/etc/condor-ce/config.d/'],
  }
  
  # file HTCondorCE 02-ce-condor.conf
  file { '/etc/condor-ce/config.d/02-ce-condor.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/02-ce-condor.conf',
    require => File['/etc/condor-ce/config.d/'],
  }
  
  # file HTCondorCE 03-ce-shared-port.conf
  file { '/etc/condor-ce/config.d/03-ce-shared-port.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/03-ce-shared-port.conf',
    require => File['/etc/condor-ce/config.d/'],
  }
  
  # file HTCondorCE 03-managed-fork.conf
  file { '/etc/condor-ce/config.d/03-managed-fork.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/03-managed-fork.conf',
    require => File['/etc/condor-ce/config.d/'],
  }
  
  # file HTCondorCE 05-ce-health.conf
  file { '/etc/condor-ce/config.d/05-ce-health.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/05-ce-health.conf',
    require => File['/etc/condor-ce/config.d/'],
  }
  
  # file HTCondorCE 10-ce-collector-generated.conf
  file { '/etc/condor-ce/config.d/10-ce-collector-generated.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/10-ce-collector-generated.conf',
    require => File['/etc/condor-ce/config.d/'],
  } 
  
  # file HTCondorCE 10-osg-attributes-generated.conf
  file { '/etc/condor-ce/config.d/10-osg-attributes-generated.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/10-osg-attributes-generated.conf',
    require => File['/etc/condor-ce/config.d/'],
  } 
  
  # file HTCondorCE 99-local.conf
  file { '/etc/condor-ce/config.d/99-local.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/99-local.conf',
    require => File['/etc/condor-ce/config.d/'],
  } 
  
  # file HTCondorCE 50-osg-configure.conf
  file { '/etc/condor-ce/config.d/50-osg-configure.conf':
    ensure  => 'file',
    mode    => '0400',
    source  => 'file:///data/site_conf/condor-ce/50-osg-configure.conf',
    require => File['/etc/condor-ce/config.d/'],
  } 
  
}
