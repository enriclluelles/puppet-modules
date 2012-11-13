# $name is arbitrary. attribute "ppa" should be the ppa name, such as
# "brightbox/ruby-ng" (this is due to a bug in puppet with resources
# with slashes in them)
define apt::ppa($ppa = "") {
  exec { "apt-add-repository-$ppa":
    command => "/usr/bin/apt-add-repository ppa:$ppa",
    creates => ppa_filename($ppa),
    notify  => Exec["apt-update-${name}"],
    require => Package['python-software-properties'],
  }

  # Hack to avoid "dependency cicly".
  exec { "apt-update-${name}":
    command => '/usr/bin/apt-get update',
    refreshonly => true,
  }

  if ! defined(Package['python-software-properties']) {
    package { 'python-software-properties': }
  }
}

