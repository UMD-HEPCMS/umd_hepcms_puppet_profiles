# Install Class for Condor master Node
class profile::condor::master::install {

# Install the Condor package 
 package { 'condor':
    ensure => 'installed',
  }

}
