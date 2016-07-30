# Install Class for Condor master Node
class profile::condor::master::install {
  package { 'condor':
    ensure => 'installed',
  }
}
