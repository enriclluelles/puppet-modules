class redis(
  $log_level = 'warning',
  $databases = 16,
  $appendonly = 'no',
  $dbfilename = 'dump.rdb',
  $snapshotting = true,
  $maxmemory = 0,
  $maxmemory_policy = 'volatile-lru',
  $port = 6379,
  $redis_ppa = 'rwky/redis',
) {


  apt::ppa { $redis_ppa:
    ppa => $redis_ppa,
  }

  package { 'redis-server':
    ensure => latest,
    require => Apt::Ppa[$redis_ppa],
  }

  service { 'redis-server':
    ensure => running,
    enable => true,
    require => Package['redis-server'],
  }

  file { '/etc/redis/redis.conf':
    content => template('redis/etc/redis.conf.erb'),
    mode => '0644',
    owner => root,
    group => root,
    require => Package['redis-server'],
    notify => Service['redis-server'],
  }

}
