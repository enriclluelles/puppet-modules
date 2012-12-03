class imagemagick (
  $ensure = 'latest',
) {

  package { 'imagemagick':
    ensure => $ensure,
  }

  package { 'libmagickwand-dev':
    ensure => $ensure,
  }

}
