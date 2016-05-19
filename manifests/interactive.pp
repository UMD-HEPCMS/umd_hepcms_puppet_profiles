# Test file for INT, to pick up by the VMTEST
class profile::interactive  {
 notify { 'interactive profile': }
 # wont actually run the command but will check if installed 
 exec { 'Office Suite and Productivity':
  #command => '/usr/bin/yum -y groupinstall "Office Suite and Productivity"',
  command => '/bin/ls'
  onlyif => '/usr/bin/yum grouplist \"Office Suite and Productivity\" | /bin/grep \"^Installed Groups\"',
  notify => "Office Suite and Productivity not installed"
 }
 exec { 'Graphics Creation Tools':
  #command => '/usr/bin/yum -y groupinstall "Graphics Creation Tools"',
  onlyif => '/usr/bin/yum grouplist "Graphics Creation Tools" | /bin/grep "^Installed Groups"',
  notify { "Graphics Creation Tools  not installed": }
  }
   unless  => '/usr/bin/yum grouplist "Desktop" | /bin/grep "^Installed Groups"',
   #command => '/usr/bin/yum -y groupinstall "Desktop"',
  notify { "Desktop not installed": }
  
   unless  => '/usr/bin/yum grouplist "X Window System" | /bin/grep "^Installed Groups"',
   #command => '/usr/bin/yum -y groupinstall "X Window System"',
   notify { "X Window System  not installed": }
  
   unless  => '/usr/bin/yum grouplist "TeX support" | /bin/grep "^Installed Groups"',
   #command => '/usr/bin/yum -y groupinstall "TeX support"',
   notify { "TeX Support not installed": }
  
    unless  => '/usr/bin/yum grouplist "Desktop Platform Development" | /bin/grep "^Installed Groups"',
    #command => '/usr/bin/yum -y groupinstall "Desktop Platform Development"',
    notify { "Desktop Platform Development not installed": }
 }
}
