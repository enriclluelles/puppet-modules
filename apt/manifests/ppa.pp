# $name is arbitrary. attribute "ppa" should be the ppa name, such as
# "brightbox/ruby-ng" (this is due to a bug in puppet with resources
# with slashes in them)
define apt::ppa() {

  require apt

  case $::operatingsystemrelease {
    '12.04': { $cmd = '/usr/bin/add-apt-repository --yes' }
    default: { $cmd = '/usr/bin/add-apt-repository' }
  }

  exec { "apt-add-repository-${name}":
    command => "${cmd} ppa:${name}",
    creates => ppa_filename($name),
    notify => Exec['apt-update'],
  }

}
