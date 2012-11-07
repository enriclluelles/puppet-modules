stage { 'pre-flight': before => Stage[main] }
class { 'base': stage => 'pre-flight' }

class base {

  include base::time

  $packagelist = ['git-core', 'vim', 'screen', 'htop', 'tcpdump']

  package { $packagelist:
    ensure => installed,
  }

  host { "${hostname}.lan" :
    ensure => present,
    host_aliases => $hostname,
    ip => "127.0.0.1"
  }

  host { 'localhost' :
    ensure => present,
    ip => "127.0.0.1"
  }

}
