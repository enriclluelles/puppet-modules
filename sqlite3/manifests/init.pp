class sqlite3 {

  $packagelist = ['sqlite3', 'libsqlite3-dev']

  package { $packagelist:
    ensure => installed,
  }

}
