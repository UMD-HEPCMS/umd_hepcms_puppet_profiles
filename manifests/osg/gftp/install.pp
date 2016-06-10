# == Class: profile::osg::gftp::install 
class profile::osg::gftp::install {

  include ::osg::gridftp
  
  # ensure that osg-se-hadoop-client is installed
  package { 'osg-se-hadoop-client':
    ensure  => 'installed',
    require => Yumrepo['osg'], # If the package comes from OSG repos, then may also want to include OSG class 
  }
   package { 'osg-gridftp':
    ensure  => 'present',
  }
  
  package {'lcmaps-plugins-gums-client':
	ensure => 'installed',
  }
  package {'lcmaps-plugins-basic':
    ensure => 'installed',
  }
}
