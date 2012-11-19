class env {

  file { '/usr/local/bin/_':
    ensure => file,
    owner => root,
    group => root,
    mode => '0755',
    source => 'puppet:///modules/env/usr/local/bin/_',
  }

}
