# == Class: iptables::post
#
# Sets the firewall rules that are added at the end
# of the chain
#
# === Authors:
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright:
#
# Copyright 2012 Trey Dockendorf, unless otherwise noted.
#
class profile::iptables::post {
  include profile::iptables

  firewall { '999 deny all':
    proto  => 'all',
    action => $profile::iptables::post_rules_action,
    reject => $profile::iptables::post_rules_reject,
    before => undef,
  }

  firewall { '999 deny all FORWARD':
    proto  => 'all',
    action => $profile::iptables::post_rules_action,
    reject => $profile::iptables::post_rules_reject,
    chain  => 'FORWARD',
    before => undef,
  }

  firewall { '999 deny all - ipv6':
    proto    => 'all',
    action   => $profile::iptables::post_rules_action,
    reject   => $profile::iptables::post_rules_ipv6_reject,
    provider => 'ip6tables',
    before   => undef,
  }

  firewall { '999 deny all FORWARD - ipv6':
    proto    => 'all',
    action   => $profile::iptables::post_rules_action,
    reject   => $profile::iptables::post_rules_ipv6_reject,
    chain    => 'FORWARD',
    provider => 'ip6tables',
    before   => undef,
  }

}
