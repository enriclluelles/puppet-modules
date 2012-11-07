define base::set_hostname($hostname) {

  exec { 'hostname':
    command => "hostname ${hostname}",
    unless => "test `hostname` = '${hostname}'"
  }

  file { '/etc/hostname':
    content => $hostname
  }

}
