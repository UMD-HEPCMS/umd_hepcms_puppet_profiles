# Condor Worker Node Services
class profile::condor::worker::services {

 service {'condor':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }

}
