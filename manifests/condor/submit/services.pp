# Condor Submit Node Services
class profile::condor::submit::services {

 service {'condor':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }

}
