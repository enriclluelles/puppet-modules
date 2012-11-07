class base::packages {

  $packagelist = ['git-core', 'vim', 'screen', 'htop', 'tcpdump']

  package { $packagelist:
    ensure => installed,
  }

}
