class base::packages {

  $packagelist = [
    'build-essential',
    'vim',
    'screen',
    'htop',
    'iotop',
    'tcpdump',
    'lsb-release',
    'curl',
    'ack-grep',
  ]

  package { $packagelist: }

  if ! defined(Package['git-core']) {
    package { 'git-core': }
  }

}
