class base::packages {

  $packagelist = ['git-core', 'vim', 'screen', 'htop', 'tcpdump', 'lsb-release', 'curl']

  package { $packagelist:
    ensure => installed,
  }

}
