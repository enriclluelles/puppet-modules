class base::time(
  $localtime = 'Europe/Madrid',
) {

  file { '/etc/localtime':
    source => "/usr/share/zoneinfo/${localtime}",
  }

  package { 'ntp':
    ensure => present,
  }

  service { 'ntp':
    ensure => running,
    require => Package['ntp'],
  }

  case $operatingsystem {
    'CentOS':  {
      file { '/etc/sysconfig/ntpd':
        content => template('base/ntp/ntpd-sysconfig'),
      }
    }

    'Debian': {
      # todo
    }
  }

}
