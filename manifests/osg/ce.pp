#Initialization of facts for the Compute Element
# == Class: profile::osg::ce
class profile::osg::ce {

  include ce
  include profile::osg 
  include osg::cacerts
    
}
