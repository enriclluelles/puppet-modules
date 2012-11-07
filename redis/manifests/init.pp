class redis {

    apt::ppa { 'ppa:rwky/redis': }

    package { 'redis-server':
        ensure  => latest,
        require => Apt::Ppa['ppa:rwky/redis'],
    }

    service { 'redis-server':
        ensure  => running,
        enable  => true,
        require => Package['redis-server'],
    }

}
