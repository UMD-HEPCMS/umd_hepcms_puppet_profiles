#Initialization of facts for the Compute Element
# == Class: profile::osg::ce
class profile::osg::ce {

  include ce
  include profile::osg 
  include osg::cacerts
  
  # test anchor 
 # anchor { 'osg::ce::start': }->
 # Class['osg']->
 # Class['osg::cacerts']->
 # class { 'osg::ce::install': }->
 # Class['osg::gridftp']->
 # class { 'osg::ce::config': }->
 # class { 'osg::ce::service': }->
 # anchor { 'osg::ce::end': }
  
  

}
