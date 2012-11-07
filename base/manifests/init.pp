stage { 'pre-flight': before => Stage[main] }
class { 'base': stage => 'pre-flight' }

class base {

  include base::time
  include base::packages

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
