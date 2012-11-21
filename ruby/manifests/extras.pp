class ruby::extras(
  $ensure = 'present',
) {

  if ! defined(Package['libxslt1-dev']) {
    package { 'libxslt1-dev': ensure => $ensure; }
  }

}
