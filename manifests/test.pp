# Test Puppet Class
class profile::test {
  
  # test file 
###   file { '/etc/test_template':
###     ensure => 'file',
###     content  => template('profile/test.erb'),
###   }
  sudo::conf { 'bestman':
   ensure => present,
   content => template('profile/bestman.sudo.erb'),
 }
 

cron { 'get_omsa_reports':
  command => '/usr/bin/bash /data/monitoring/scripts/run_omreport.sh',
  user    => 'root',
  hour    => 22,
  minute  => 0,
}
  
}
