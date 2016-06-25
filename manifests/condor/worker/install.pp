# Install Class for Condor worker Node
class profile::condor::worker::install {
  package { 'condor':
    ensure => 'installed',
  }
}
