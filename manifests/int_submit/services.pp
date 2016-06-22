# Condor Submit Node Services
class profile::int_submit::services {

 service {'condor':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }

}
