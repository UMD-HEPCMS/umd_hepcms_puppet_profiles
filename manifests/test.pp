# Test Puppet Class
class profile::test {
  
  # test file 
  file { '/etc/test_template':
    ensure => 'file',
    content  => template('profile/test.erb'),
  }
 
  
}
