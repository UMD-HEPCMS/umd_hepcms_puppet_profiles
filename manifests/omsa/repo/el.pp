# Private class
class profile::omsa::repo::el {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  if $profile::omsa::use_mirror {
    $indep_baseurl        = 'absent'
    $indep_mirrorlist     = $profile::omsa::indep_mirrorlist
    $hardware_baseurl     = 'absent'
    $hardware_mirrorlist  = $profile::omsa::hardware_mirrorlist
  } else {
    $indep_baseurl        = $profile::omsa::indep_baseurl
    $indep_mirrorlist     = 'absent'
    $hardware_baseurl     = $profile::omsa::hardware_baseurl
    $hardware_mirrorlist  = 'absent'
  }

  if $profile::omsa::enable_hardware_repo {
    $hardware_enabled = '1'
  } else {
    $hardware_enabled = '0'
  }

  yumrepo { 'dell-omsa-indep':
    descr          => 'Dell OMSA repository - Hardware independent',
    baseurl        => $indep_baseurl,
    mirrorlist     => $indep_mirrorlist,
    enabled        => '1',
    gpgcheck       => '1',
    gpgkey         => "${profile::omsa::dell_gpgkey} ${profile::omsa::libsmbios_gpgkey}",
    failovermethod => 'priority',
  }

  yumrepo { 'dell-omsa-specific':
    descr          => 'Dell OMSA repository - Hardware specific',
    baseurl        => $hardware_baseurl,
    mirrorlist     => $hardware_mirrorlist,
    enabled        => $hardware_enabled,
    gpgcheck       => '1',
    gpgkey         => "${profile::omsa::dell_gpgkey} ${profile::omsa::libsmbios_gpgkey}",
    failovermethod => 'priority',
  }

  package { 'yum-dellsysid':
    ensure  => 'present',
    require => Yumrepo['dell-omsa-indep'],
  }
}
