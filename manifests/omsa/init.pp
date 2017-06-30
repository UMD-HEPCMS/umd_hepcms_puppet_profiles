# Class: omsa: See README.md for documentation
class profile::omsa (
  $use_mirror             = true,
  $indep_baseurl          = $profile::omsa::params::indep_baseurl,
  $indep_mirrorlist       = $profile::omsa::params::indep_mirrorlist,
  $hardware_baseurl       = $profile::omsa::params::hardware_baseurl,
  $hardware_mirrorlist    = $profile::omsa::params::hardware_mirrorlist,
  $enable_hardware_repo   = true,
  $dell_gpgkey            = $profile::omsa::params::dell_gpgkey,
  $libsmbios_gpgkey       = $profile::omsa::params::libsmbios_gpgkey,
  $install_type           = 'all',
  $install_firmware_tools = true,
) inherits profile::omsa::params {

  validate_bool($use_mirror, $enable_hardware_repo, $install_firmware_tools)
  validate_re($install_type, ['^all$', '^minimal$'])

  case $::manufacturer {
    /Dell/: {
      include profile::omsa::repo
      include profile::omsa::install
      include profile::omsa::service

      anchor { 'profile::omsa::begin': }
      anchor { 'profile::omsa::end': }

      Anchor['profile::omsa::begin']->
      Class['profile::omsa::repo']->
      Class['profile::omsa::install']->
      Class['profile::omsa::service']->
      Anchor['profile::omsa::end']
    }
    # If not Dell, do nothing
    default: { }
  }

}
