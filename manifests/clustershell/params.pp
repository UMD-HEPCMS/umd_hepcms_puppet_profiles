# == Class: clustershell::params
#
# Handles OS-specific configuration of the clustershell module.
#
# === Authors:
#
# Geoff Johnson <geoff.jay@gmail.com>
#
# === Copyright:
#
# Copyright (C) 2014 Geoff Johnson, unless otherwise noted.
#

class profile::clustershell::params {

  $fanout = $profile::clustershell_fanout ? {
    undef   => 64,
    default => $profile::clustershell_fanout,
  }

  $connect_timeout = $profile::clustershell_connect_timeout ? {
    undef   => 15,
    default => $profile::clustershell_connect_timout,
  }

  $command_timeout = $profile::clustershell_command_timeout ? {
    undef   => 0,
    default => $profile::clustershell_command_timeout,
  }

  $color = $profile::clustershell_color ? {
    undef   => 'auto',
    default => $profile::clustershell_color,
  }

  $fd_max = $profile::clustershell_fd_max ? {
    undef   => 16384,
    default => $profile::clustershell_fd_max,
  }

  $history_size = $profile::clustershell_history_size ? {
    undef   => 100,
    default => $profile::clustershell_history_size,
  }

  $node_count = $profile::clustershell_node_count ? {
    undef   => 'yes',
    default => $profile::clustershell_node_count,
  }

  $verbosity = $profile::clustershell_verbosity ? {
    undef   => '1',
    default => $profile::clustershell_verbosity,
  }

  # if top scope variable is a string, might need to convert to boolean
  $ssh_enable = $profile::clustershell_ssh_enable ? {
    undef   => false,
    default => $profile::clustershell_ssh_enable,
  }
  if is_string($ssh_enable) {
    $safe_ssh_enable = str2bool($ssh_enable)
  } else {
    $safe_ssh_enable = $ssh_enable
  }

  $ssh_user = $profile::clustershell_ssh_user ? {
    undef   => 'root',
    default => $profile::clustershell_ssh_user,
  }

  $ssh_path = $profile::clustershell_ssh_path ? {
    undef   => '/usr/bin/ssh',
    default => $profile::clustershell_ssh_path,
  }

  $ssh_options = $profile::clustershell_ssh_options ? {
    undef   => '-oStrictHostKeyChecking=no',
    default => $profile::clustershell_ssh_options,
  }

  # Following parameters should not be changed.
  $ensure = $profile::clustershell_ensure ? {
    undef   => 'present',
    default => $profile::clustershell_ensure,
  }

  # if top scope variable is a string, might need to convert to boolean
  $install_vim_syntax = $profile::clustershell_install_vim_syntax ? {
    undef   => false,
    default => $profile::clustershell_install_vim_syntax,
  }
  if is_string($install_vim_syntax) {
    $safe_install_vim_syntax = str2bool($install_vim_syntax)
  } else {
    $safe_install_vim_syntax = $install_vim_syntax
  }

  $groupmembers = {}

  case $::osfamily {
    redhat: {
      $package_require      = 'Yumrepo[epel]'
      $package_name         = 'clustershell'
      $vim_package_name     = 'vim-clustershell'

      $clush_conf_dir       = '/etc/clustershell'

      $clush_conf           = '/etc/clustershell/clush.conf'
      $clush_conf_template  = 'clustershell/clush.conf.erb'

      $groups_config        = '/etc/clustershell/groups'
      $groups_concat_dir    = '/etc/clustershell/tmp'

      $groups_conf          = '/etc/clustershell/groups.conf'
      $groups_conf_template = 'clustershell/groups.conf.erb'

      $groups_dir           = '/etc/clustershell/groups.conf.d'
    }
    debian: {
      $package_require      = undef
      $package_name         = 'clustershell'

      $clush_conf           = '/etc/clustershell/clush.conf'
      $clush_conf_template  = 'clustershell/clush.conf.erb'

      $groups_config        = '/etc/clustershell/groups'
      $groups_concat_dir    = '/etc/clustershell/tmp'

      $groups_conf          = '/etc/clustershell/groups.conf'
      $groups_conf_template = 'clustershell/groups.conf.erb'

      $groups_dir           = '/etc/clustershell/groups.conf.d'
    }
    default: {
      fail("Module ${module_name} is not support on ${::osfamily}")
    }
  }
}
