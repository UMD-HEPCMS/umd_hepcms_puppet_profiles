class profile::ganglia {

  package { 'ganglia-gmond':
    ensure => 'installed',
    provider => "yum",
  }
  # pull file from /data
  file { '/etc/ganglia/gmond.conf':
    ensure => file,
    source => 'file:////data/site_conf/ganglia/gmond.conf',
    require => Package['ganglia-gmond'],
  }
 
 service {"gmond":
  ensure => 'running',
  enable => 'true',
  hasstatus => true,
  hasrestart => true,
  require => Package['ganglia-gmond'],
}
 
}
