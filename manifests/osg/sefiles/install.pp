# == Class: profile::osg::sefiles::install 
class profile::osg::sefiles::install {

 package { 'osg-se-bestman':
    ensure  => 'installed',
  }
## restart the service every Saturday 1:15am cron job - per US CMS T3 recommendation
cron { 'restart bestman2':
  command => '/sbin/service bestman2 restart',
  user    => 'root',
  hour    => '1',
  minute  => '15',
  date    => '*',
  month   => '*',
  weekday => '6',
}

}
