class imagemagick {

  package { 'imagemagick':
    ensure => installed,
  }

  package { 'libmagickwand-dev':
    ensure => installed,
  }

}
