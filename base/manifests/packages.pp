class base::packages {

  $packagelist = [
    'build-essential',
    'git-core',
    'vim',
    'screen',
    'htop',
    'tcpdump',
    'lsb-release',
    'curl',
    'ack-grep',
  ]

  package { $packagelist: }

}
