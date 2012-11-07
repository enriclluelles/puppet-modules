class postgres::ubuntu {

  exec { 'get-postgres-apt-key':
    command => "/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv 8683D8A2",
    unless => "/usr/bin/apt-key list | /bin/grep 8683D8A2",
  }

  file { '/etc/apt/sources.list.d/postgres.list':
    ensure => present,
    owner => root,
    group => root,
    content => "deb http://ppa.launchpad.net/pitti/postgresql/ubuntu ${lsbdistcodename} main",
    require => Exec['get-postgres-apt-key'],
  }

  exec { 'update apt to find postgres':
    command => '/usr/bin/apt-get -y update',
    require => File['/etc/apt/sources.list.d/postgres.list'],
    subscribe => File['/etc/apt/sources.list.d/postgres.list'],
    refreshonly => true,
  }

}
