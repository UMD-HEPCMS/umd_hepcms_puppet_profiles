# == Class: profile::osg::sefiles::install 
class profile::osg::sefiles::install {

 package { 'osg-se-bestman':
    ensure  => 'installed',
  }

}
