class base::packages {

  $packagelist = ['git-core', 'vim', 'screen', 'htop', 'tcpdump', 'lsb-release']

  package { $packagelist:
    ensure => installed,
  }

}
