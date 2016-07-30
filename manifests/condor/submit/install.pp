# Install Class for Condor Submit INT Node
class profile::condor::submit::install {
  package { 'condor':
    ensure => 'installed',
  }
}
