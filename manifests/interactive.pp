# Test file for INT, to pick up by the VMTEST
class profile::interactive  {
 notify { 'interactive profile': }
 # wont actually run the command but will check if installed 
 exec { 'Office Suite and Productivity':
  #command => '/usr/bin/yum -y groupinstall "Office Suite and Productivity"',
  onlyif => '/usr/bin/yum grouplist "Office Suite and Productivity" | /bin/grep "^Installed Groups"',
  notify {"Office Suite and Productivity not installed":},
 }
 exec { 'Graphics Creation Tools':
  #command => '/usr/bin/yum -y groupinstall "Graphics Creation Tools"',
  onlyif => '/usr/bin/yum grouplist "Graphics Creation Tools" | /bin/grep "^Installed Groups"',
  notify => "Graphics Creation Tools  not installed",
 }
 exec { 'Desktop':
  #command => '/usr/bin/yum -y groupinstall "Desktop"',
  onlyif => '/usr/bin/yum grouplist "Desktop" | /bin/grep "^Installed Groups"',
  notify => "Desktop not installed",
 }
 exec { 'X Window System': 
   #command => '/usr/bin/yum -y groupinstall "X Window System"',
   onlyif => '/usr/bin/yum grouplist "X Window System" | /bin/grep "^Installed Groups"',
   notify => "X Window System  not installed",
 }
 exec { 'TeX Support': 
   #command => '/usr/bin/yum -y groupinstall "TeX support"',
   onlyif => '/usr/bin/yum grouplist "TeX support" | /bin/grep "^Installed Groups"',
   notify => "TeX Support not installed",
 }
 exec { 'Desktop Platform Development':
  #command => '/usr/bin/yum -y groupinstall "Desktop Platform Development"',
  onlyif => '/usr/bin/yum grouplist "Desktop Platform Development" | /bin/grep "^Installed Groups"',
  notify => "Desktop Platform Development not installed",
 }
}
