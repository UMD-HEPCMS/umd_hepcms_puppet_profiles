# == Class: profile::ovirt::all_in_one
class profile::ovirt::all_in_one inherits profile::params {

  $nfs_export_values = {
    'host' => '127.0.0.1',
    'options' => 'rw,insecure,all_squash,no_subtree_check,anonuid=36,anongid=36'
  }

  $nfs_exports = {
    "${profile::params::ovirt_base_storage_path}/iso"           => [$nfs_export_values],
    "${profile::params::ovirt_base_storage_path}/import_export" => [$nfs_export_values],
  }

  class { '::nfs':
    server          => true,
    manage_firewall => false,
    exports         => $nfs_exports,
  }

  class { '::ovirt::engine':
    application_mode         => 'virt',
    config_allinone          => true,
    local_storage_path       => "${profile::params::ovirt_base_storage_path}/data",
    manage_firewall          => false,
    update_firewall          => false,
    manage_postgresql_server => true,
    nfs_config_enabled       => false,
    run_engine_setup         => false,
    storage_type             => 'none',
    enable_reports           => false,
    storeconfigs_enabled     => false,
  }

  class { '::ovirt::engine::backup':
    backup_dir => "${profile::params::ovirt_base_storage_path}/backup",
  }

  firewall { '100 allow HTTP':
    chain  => 'INPUT',
    port   => '80',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '100 allow HTTPS':
    chain  => 'INPUT',
    port   => '443',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '100 allow ovirt-websocket-proxy':
    chain  => 'INPUT',
    port   => '6100',
    proto  => 'tcp',
    action => 'accept',
  }

}
