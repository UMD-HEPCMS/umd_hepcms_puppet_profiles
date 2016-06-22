# Install Class for Condor Submit INT Node
class profile::int_submit::install {
  package { 'condor':
    ensure => 'installed',
  }
}
