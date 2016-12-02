class profile::run_omreport {
  cron { 'get_omsa_reports':
    command => '/bin/bash /data/monitoring/scripts/run_omreport.sh',
    user    => 'root',
    hour    => 22,
    minute  => 0,
  }
}
