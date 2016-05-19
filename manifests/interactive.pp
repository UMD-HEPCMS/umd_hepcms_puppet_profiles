# Test file for INT, to pick up by the VMTEST
class profile::interactive  {
 notify { 'interactive profile': }
 # wont actually run the command but will check if installed 
 exec { 'Office Suite and Productivity':
  #command => '/usr/bin/yum -y groupinstall "Office Suite and Productivity"',
  command => 'echo "Office Suite and Productivity not installed" ; echo "uh oh"',
  onlyif => '/usr/bin/yum grouplist "Office Suite and Productivity" | /bin/grep "^Installed Groups"',
 }
 exec { 'Graphics Creation Tools':
  #command => '/usr/bin/yum -y groupinstall "Graphics Creation Tools"',
  command => 'echo "Graphics Creation Tools  not installed"',
  onlyif => '/usr/bin/yum grouplist "Graphics Creation Tools" | /bin/grep "^Installed Groups"',
 }
 exec { 'Desktop':
  #command => '/usr/bin/yum -y groupinstall "Desktop"',
  command => 'echo "Desktop not installed"',
  onlyif => '/usr/bin/yum grouplist "Desktop" | /bin/grep "^Installed Groups"',
 }
 exec { 'X Window System': 
  #command => '/usr/bin/yum -y groupinstall "X Window System"',
  command => 'echo "X Window System  not installed"',
  onlyif => '/usr/bin/yum grouplist "X Window System" |/bin/grep "^Installed Groups"',
 }
 exec { 'TeX Support': 
  #command => '/usr/bin/yum -y groupinstall "TeX support"',
  command => 'echo "TeX Support not installed"',
  onlyif => '/usr/bin/yum grouplist "TeX support" | /bin/grep "^Installed Groups"',
 }
 exec { 'Desktop Platform Development':
  #command => '/usr/bin/yum -y groupinstall "Desktop Platform Development"',
  command => 'echo "Desktop Platform Development not installed"',
  onlyif => '/usr/bin/yum grouplist "Desktop Platform Development" | /bin/grep "^Installed Groups"',
 }
}
