# == Class: profile::osg::gftp::install 
class profile::osg::gftp::install {

#  include ::osg::gridftp
  
  # ensure that osg-se-hadoop-gridftp is installed
   package { 'osg-se-hadoop-gridftp':
    ensure  => 'present',
  }
  
  package {'lcmaps-plugins-gums-client':
	ensure => 'installed',
  }
  package {'lcmaps-plugins-basic':
    ensure => 'installed',
  }
}
