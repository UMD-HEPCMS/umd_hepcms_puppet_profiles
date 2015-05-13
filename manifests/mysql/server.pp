# == Class: profile::mysql::server
class profile::mysql::server inherits profile::params {

  include ::mysql::server
  include ::mysql::server::backup

}
