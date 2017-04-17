class profile::coretempreport {
  cron { 'coretempreport':
    command => '/etc/ganglia/sensors_gmetric.sh 2>&1 /dev/null',
    user    => 'root',
    minute  => '*/5',
  }
}
