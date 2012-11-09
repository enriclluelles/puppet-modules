define apache::ports(
  $port = 80,
  $ssl_port = 443,
) {

  file { '/etc/apache2/ports.conf':
    content => template('apache/etc/apache2/ports.conf'),
    mode    => '0644',
    owner   => root,
    group   => root,
    require => Package['apache2'],
    notify  => Service['apache2'],
  }

}
