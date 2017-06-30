# Juste a simple concat files to manage groups
define profile::clustershell::groupmember (
  $group,
  $member = $title,
) {

  $data = {
    "${group}" => any2array($member),
  }

  datacat_fragment { "profile::clustershell::groupmember ${title}":
    target => 'clustershell-groups',
    data   => $data,
  }

}
