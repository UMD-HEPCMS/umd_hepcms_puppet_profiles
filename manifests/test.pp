# Test Puppet Class
class profile::test {
  
  # test file 
  file { '/etc/test_template':
    ensure => 'file',
    content  => template('profile/test.erb'),
  }
  sudo::conf { 'sudoers-bestman':
   ensure => present,
   source => 'file:///data/site_conf/sefiles/bestman/sudoers-bestman',
   sudo_file_name  => 'sudoers-bestman',
 }
  
}
