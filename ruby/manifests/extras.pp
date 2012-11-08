class ruby::extras {

  if ! defined(Package['libxslt-dev']) {
    package { 'libxslt-dev': ensure => latest; }
  }

  if ! defined(Package['libxml2-dev']) {
    package { 'libxml2-dev': ensure => latest; }
  }

}
