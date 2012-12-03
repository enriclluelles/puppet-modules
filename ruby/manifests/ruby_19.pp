class ruby::ruby_19(
  $ensure = 'latest',
) {

  include ruby::extras

  $packagelist = [
    'ruby1.9.1',
    'ruby1.9.1-dev',
    'ri1.9.1',
  ]

  package { $packagelist:
    ensure => $ensure,
  }

  package { 'bundler':
    ensure   => '1.2.1',
    provider => gem,
    require  => Exec['gem19-default'],
  }

  exec { 'ruby19-default':
    command => '/usr/sbin/update-alternatives --set ruby /usr/bin/ruby1.9.1',
    unless  => 'ruby --version | grep 1.9.3',
    require => Package['ruby1.9.1'],
  }

  exec { 'gem19-default':
    command => '/usr/sbin/update-alternatives --set gem /usr/bin/gem1.9.1',
    unless  => 'cat $(which gem) | grep 1.9',
    require => Package['ruby1.9.1'],
  }

}
