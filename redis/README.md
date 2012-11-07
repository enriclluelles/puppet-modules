# Puppet Redis

## Usage

    class { 'redis':
      log_level => 'warning',
      port => 6379,
      maxmemory => '2gb',
      snapshotting => false,
    }
