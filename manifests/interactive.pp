# Test file for INT, to pick up by the VMTEST
class profile::interactive ($nisup => false) {

 #All execs will use this path
 Exec { path => ['/bin/', '/usr/bin/', '/usr/bin/yum/' ] }
 notify { 'Interactive profile': }
 # Switch the comments on command if you just want to check if the packages are installed
 
 exec { 'Office Suite and Productivity absent':
  command => 'echo "Office Suite and Productivity not installed, installing now" ; yum -y groupinstall "Office Suite and Productivity"',
  #command => 'echo "Office Suite and Productivity not installed"',
  unless => 'yum grouplist "Office Suite and Productivity" | grep "^Installed Groups"',
  logoutput => true,
 }
 exec { 'Office Suite and Productivity present' :
  command => 'echo "Office Suite and Productivity is already installed"',
  onlyif => 'yum grouplist "Office Suite and Productivity" | grep "^Installed Groups"',
  logoutput => true,
 }
 
 exec { 'Graphics Creation Tools absent':
  command => 'echo "Graphics Creation Tools not installed, installing now" ; yum -y groupinstall "Graphics Creation Tools"',
  #command => 'echo "Graphics Creation Tools not installed"',
  unless => 'yum grouplist "Graphics Creation Tools" | grep "^Installed Groups"',
  logoutput => true,
 }
 exec { 'Graphics Creation Tools present':
  command => 'echo "Graphics Creation Tools is already installed"',
  onlyif => 'yum grouplist "Graphics Creation Tools" | grep "^Installed Groups"',
  logoutput => true,
 }
 
 exec { 'Desktop absent':
  command => 'echo "Desktop not installed, installing now" ; yum -y groupinstall "Desktop"',
  #command => 'echo "Desktop not installed"',
  unless => 'yum grouplist "Desktop" | grep "^Installed Groups"',
  logoutput => true,
 }
 exec { 'Desktop present':
  command => 'echo "Desktop is already installed"',
  onlyif => 'yum grouplist "Desktop" | grep "^Installed Groups"',
  logoutput => true,
 }
 
 exec { 'X Window System absent': 
  command => 'echo "X Window System not installed, installing now" ; yum -y groupinstall "X Window System"',
  #command => 'echo "X Window System not installed"',
  unless => 'yum grouplist "X Window System" | grep "^Installed Groups"',
  logoutput => true,
 }
 exec { 'X Window System present': 
  command => 'echo "X Window System is already installed"',
  onlyif => 'yum grouplist "X Window System" | grep "^Installed Groups"',
  logoutput => true,
 }
 
 exec { 'TeX Support absent': 
  command => 'echo "TeX Support not installed, installing now" ; yum -y groupinstall "TeX support"',
  #command => 'echo "TeX Support not installed"',
  unless => 'yum grouplist "TeX support" | grep "^Installed Groups"',
  logoutput => true,
 }
 exec { 'TeX Support present':
  command => 'echo "TeX Support is already installed"',
  onlyif => 'yum grouplist "TeX support" | grep "^Installed Groups"',
  logoutput => true,
 }
 
 exec { 'Desktop Platform Development absent':
  command => 'echo "Desktop Platform Development not installed, installing now" ; yum -y groupinstall "Desktop Platform Development"',
  #command => 'echo "Desktop Platform Development not installed"',
  unless => 'yum grouplist "Desktop Platform Development" | grep "^Installed Groups"',
  logoutput => true,
 }
 exec { 'Desktop Platform Development present':
  command => 'echo "Desktop Platform Development is already installed"',
  onlyif => 'yum grouplist "Desktop Platform Development" | grep "^Installed Groups"',
  logoutput => true,
 }
 
 exec { 'NIS activation':
  #command => 'authconfig --enablenis --nisdomain=nishepcms.privnet --nisserver=10.1.0.1 --disablefingerprint --disablelocauthorize --enablemd5 --update',
  command => 'NIS doesn't appear to be up',
  unless => $nisup,
  $nisup => true,
 }
}
