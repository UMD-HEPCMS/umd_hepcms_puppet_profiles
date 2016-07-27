# Install Class for Condor worker Node
class profile::condor::worker::install {
  package { 'condor':
    ensure => 'installed',
  }
  
  node 'r510-0-4' { 'tuned':
    ensure => 'installed',
}
