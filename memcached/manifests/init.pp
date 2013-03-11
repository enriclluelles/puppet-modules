class memcached(
  $mem = 64,
  $port_number = 11211,
) {

    package { 'memcached':
        ensure => installed,
    }

    file { '/etc/default/memcached':
        ensure => file,
        owner  => root,
        group  => root,
        mode   => '0644',
        source => 'puppet:///modules/memcached/etc/default/memcached',
        notify => Service['memcached'],
    }

    service { 'memcached':
        ensure  => running,
        enable  => true,
        require => Package['memcached'],
    }

    file { '/etc/memcached.conf':
        content => template('memcached/etc/memcached.conf.erb'),
        owner   => root,
        group   => root,
        mode    => '0644',
        notify  => Service['memcached'],
    }

}
