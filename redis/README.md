# Puppet Redis

## Usage

    include redis

    redis::config { 'redis':
        log_level => 'warning',
        port => 6379,
        maxmemory => '2gb',
        snapshotting => false,
    }
