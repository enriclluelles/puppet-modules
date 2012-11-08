class ruby::gemrc {

  file { '/etc/gemrc':
    ensure => file,
    source => 'puppet:///modules/ruby/etc/gemrc',
  }

}
