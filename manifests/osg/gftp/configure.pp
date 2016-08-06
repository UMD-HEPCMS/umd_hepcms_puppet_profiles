# == Class: profile::osg::gftp::configure 
class profile::osg::gftp::configure {

  # ensure gratia gridftp-transfer dir exists
  file { '/etc/gratia/gridftp-transfer':
   ensure => directory,
  }
  
   # Probe Config file
  file { '/etc/gratia/gridftp-transfer/ProbeConfig':
   ensure => file,
   owner => root,
   source  => 'file:///data/site_conf/gridftp/gratia/ProbeConfig',
  }
file { '/etc/grid-security/hostkey.pem':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0400',
      source => 'file:///data/site_conf/gridftp/certs/hostkey.pem',
    }
file { '/etc/grid-security/hostcert.pem':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0444',
      source => 'file:///data/site_conf/gridftp/certs/hostcert.pem',
  }
	
file { '/etc/sysconfig/globus-gridftp-server':
	ensure  => 'file',
     	owner   => 'root',
     	group   => 'root',
     	mode    => '0644',
     	source => 'file:///data/site_conf/gridftp/globus-gridftp-server',
 }
  file { '/etc/lcmaps.db':
     ensure  => 'file',
     owner   => 'root',
     group   => 'root',
     mode    => '0644',
     source => 'file:///data/site_conf/gridftp/lcmaps.db',
  }
  
    file { '/etc/gridftp.conf':
     ensure  => 'file',
     owner   => 'root',
     group   => 'root',
     mode    => '0644',
     source => 'file:///data/site_conf/gridftp/gridftp.conf',
  }

}
