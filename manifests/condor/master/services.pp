# Condor Master Node Services
class profile::condor::master::services {

 service {'condor':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }

}
