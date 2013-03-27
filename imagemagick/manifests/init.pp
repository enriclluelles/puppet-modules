class imagemagick (
  $ensure = 'present',
) {

  package { 'imagemagick':
    ensure => $ensure,
  }

  package { 'libmagickwand-dev':
    ensure => $ensure,
  }

}
