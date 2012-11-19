class ruby::ruby_18(
  $ensure = 'installed',
) {

  include ruby::extras

  $packagelist = [
    'ruby1.8',
    'ruby1.8-dev',
    'ri1.8',
    'libreadline-ruby1.8',
    'libruby1.8',
    'libopenssl-ruby',
    'rubygems1.8',
  ]

  package { $packagelist:
    ensure => $ensure,
  }

  package { 'bundler':
    ensure   => '1.2.1',
    provider => gem,
    require  => Exec['gem18-default'],
  }

  exec { 'ruby18-default':
    command => '/usr/sbin/update-alternatives --set ruby /usr/bin/ruby1.8',
    require => Package['ruby1.8'],
  }

  exec { 'gem18-default':
    command => '/usr/sbin/update-alternatives --set gem /usr/bin/gem1.8',
    require => Package['rubygems1.8'],
  }

}
