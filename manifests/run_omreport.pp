class profile::run_ompreport {
  cron { 'get_omsa_reports':
    command => '/usr/bin/bash /data/monitoring/scripts/run_omreport.sh',
    user    => 'root',
    hour    => 22,
    minute  => 0,
  }
}
