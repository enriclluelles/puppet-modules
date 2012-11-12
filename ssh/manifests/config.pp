class ssh::config {

  file { '/etc/ssh/ssh_config':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/ssh/etc/ssh/ssh_config',
  }

}
