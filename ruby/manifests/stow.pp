class ruby::stow(
  $version = '1.9.3-p125',
) {

  include stow

  $packagelist = ['libreadline-dev', 'libxslt1-dev', 'libcurl4-openssl-dev']

  package { $packagelist:
    ensure => installed,
  }

  file { "/usr/local/bin/stow-ruby-${version}":
    ensure => 'present',
    owner => 'root',
    group => 'root',
    mode => '0700',
    source => "puppet:///modules/ruby/stow-ruby-${version}",
    require => Package['stow'],
  }

  exec { "/usr/local/bin/stow-ruby-${version}":
    command => "/usr/local/bin/stow-ruby-${version}",
    creates => "/usr/local/stow/${version}",
    timeout => '-1',
    require => File["/usr/local/bin/stow-ruby-${version}"],
  }

}
