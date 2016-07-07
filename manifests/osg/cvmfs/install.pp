# Private class: See README.md.
class profile::osg::cvmfs::install {

  package { 'cvmfs':
    ensure => installed,
    name   => 'osg-oasis',
  }

}
