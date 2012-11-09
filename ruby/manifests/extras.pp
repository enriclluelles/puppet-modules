class ruby::extras(
  $ensure = 'present',
) {

  if ! defined(Package['libxslt-dev']) {
    package { 'libxslt-dev': ensure => $ensure; }
  }

  if ! defined(Package['libxml2-dev']) {
    package { 'libxml2-dev': ensure => $ensure; }
  }

}
