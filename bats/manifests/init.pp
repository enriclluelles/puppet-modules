class bats {

    file { '/usr/local/bin/bats':
        ensure => file,
        owner  => root,
        group  => root,
        mode   => '0755',
        source => "puppet:///modules/bats/usr/local/bin/bats",
    }

    file { '/usr/local/libexec':
        ensure => directory,
        owner  => root,
        group  => root,
        mode   => '0644',
    }

    file { '/usr/local/libexec/bats':
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => '0755',
        source  => "puppet:///modules/bats/usr/local/libexec/bats",
        require => File['/usr/local/libexec'],
    }

    file { '/usr/local/libexec/bats-exec':
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => '0755',
        source  => "puppet:///modules/bats/usr/local/libexec/bats-exec",
        require => File['/usr/local/libexec'],
    }

    file { '/usr/local/libexec/bats-preprocess':
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => '0755',
        source  => "puppet:///modules/bats/usr/local/libexec/bats-preprocess",
        require => File['/usr/local/libexec'],
    }

}
