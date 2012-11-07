define redis::config(
  $log_level = 'warning',
  $databases = 16,
  $appendonly = 'no',
  $dbfilename = 'dump.rdb',
  $snapshotting = true,
  $maxmemory = 0,
  $maxmemory_policy = 'volatile-lru',
  $port = 6379,
) {

    file { "/etc/redis/${name}.conf":
        content => template('redis/redis.conf.erb'),
        mode    => '0644',
        owner   => root,
        group   => root,
        require => Package[redis-server],
        notify  => Service[redis-server],
    }

}
