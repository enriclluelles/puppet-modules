class ruby::extras(
  $ensure = 'latest',
) {

  if ! defined(Package['libxslt1-dev']) {
    package { 'libxslt1-dev': ensure => $ensure; }
  }

}
