define base::set_hostname(
  $hostname,
) {

  exec { 'hostname':
    command => "/bin/hostname ${hostname}",
    unless => "/usr/bin/test `hostname` = '${hostname}'"
  }

  file { '/etc/hostname':
    content => $hostname
  }

}
