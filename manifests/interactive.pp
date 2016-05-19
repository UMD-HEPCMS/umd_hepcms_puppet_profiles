# Test file for INT, to pick up by the VMTEST
class profile::interactive  {
 #All execs will use this path
 Exec { path => ['/bin/', '/usr/bin/', '/usr/bin/yum/' ] }
 notify { 'interactive profile': }
 # wont actually run the command but will check if installed 
 exec { 'Office Suite and Productivity':
  #command => 'yum -y groupinstall "Office Suite and Productivity"',
  command => 'echo "Office Suite and Productivity not installed" ; echo "uh oh"',
  unless => 'yum grouplist "Office Suite and Productivity" | grep "^Installed Groups"',
 }
 exec { 'Graphics Creation Tools':
  #command => 'yum -y groupinstall "Graphics Creation Tools"',
  command => 'echo "Graphics Creation Tools  not installed"',
  unless => 'yum grouplist "Graphics Creation Tools" | grep "^Installed Groups"',
 }
 exec { 'Desktop':
  #command => 'yum -y groupinstall "Desktop"',
  command => 'echo "Desktop not installed"',
  unless => 'yum grouplist "Desktop" | grep "^Installed Groups"',
 }
 exec { 'X Window System': 
  #command => 'yum -y groupinstall "X Window System"',
  command => 'echo "X Window System  not installed"',
  unless => 'yum grouplist "X Window System" | grep "^Installed Groups"',
 }
 exec { 'TeX Support': 
  #command => 'yum -y groupinstall "TeX support"',
  command => 'echo "TeX Support not installed"',
  unless => 'yum grouplist "TeX support" | grep "^Installed Groups"',
 }
 exec { 'Desktop Platform Development':
  #command => 'yum -y groupinstall "Desktop Platform Development"',
  command => 'echo "Desktop Platform Development not installed"',
  unless => 'yum grouplist "Desktop Platform Development" | grep "^Installed Groups"',
 }
}
