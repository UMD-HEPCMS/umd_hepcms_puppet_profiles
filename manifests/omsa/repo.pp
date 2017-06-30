# Private class
class profile::omsa::repo {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  anchor { 'profile::omsa::repo::begin': }
  anchor { 'profile::omsa::repo::end': }

  case $::osfamily {
    'RedHat': {
      include profile::omsa::repo::el

      Anchor['profile::omsa::repo::begin']->
      Class['profile::omsa::repo::el']->
      Anchor['profile::omsa::repo::end']
    }
    default: { }
  }
}
