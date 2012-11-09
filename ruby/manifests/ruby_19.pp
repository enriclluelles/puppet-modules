class ruby::ruby_19 {

  include ruby::extras

  $packagelist = [
    'ruby1.9.1',
    'ruby1.9.1-dev',
    'ri1.9.1',
    'rubygems1.9.1',
    'libreadline-ruby1.9.1',
  ]

  package { $packagelist:
    ensure => latest,
  }

  package { 'bundler':
    ensure   => latest,
    provider => gem,
    require  => Exec['gem19-default'],
  }

  exec { 'ruby19-default':
    command => '/usr/sbin/update-alternatives --set ruby /usr/bin/ruby1.9.1',
    require => Package['ruby1.9.1'],
  }

  exec { 'gem19-default':
    command => '/usr/sbin/update-alternatives --set gem /usr/bin/gem1.9.1',
    require => Package['rubygems1.9.1'],
  }

}