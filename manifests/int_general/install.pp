# Installation of General Software
class profile::int_general::install {

 package {'gedit':
  ensure => installed,
 }
 package {'finger':
  ensure => installed,
 }

 package {'firefox':
  ensure => installed,
 }

 package {'gv':
  ensure => installed,
 }

 package {'tkinter':
  ensure => installed,
 }
 package {'git-all':
  ensure => installed,
 }
 package {'libXaw':
  ensure => installed,
 }

 package {'Xaw3d':
  ensure => installed,
 }

 package {'Xaw3d-devel':
  ensure => installed,
 }

  package {'libXi':
  ensure => installed,
 }

  package {'tmux':
  ensure => installed,
 }

 package {'screen':
  ensure => installed,
 }

 package { 'python-pip':
   ensure => installed,
 }
}
