# == Class: iptables::nat
#
# Sets the nat POSTROUTING rule
#
class profile::iptables::nat (
  $outiface = 'eth0',
) {

  sysctl { 'net.ipv4.ip_forward':
    value => 1,
  }

  firewall { '100 snat':
    chain    => 'POSTROUTING',
    jump     => 'MASQUERADE',
    proto    => 'all',
    outiface => $outiface,
    table    => 'nat',
  }

}
