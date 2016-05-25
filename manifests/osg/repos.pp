# Yum Repository File for OSG3.3
class profile::osg::repos {
	# including the profile module 
	include profile::osg 
	# include the params file, which will initialize things
	# include profiles::osg::params 
	
	$baseurls = {
		'osg' => "https://repo.grid.iu.edu/osg/3.3/osg-3.3-el6-release-latest.rpm"
	}
	yumrepo { 'osg':
	 baseurl    => $baseurls['osg'],
	 descr      => "OSG Software for Scientific Linux 6.7",
         enabled    => '1',
	}
	
	
}
