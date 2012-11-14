class openjdk(
  $version = latest,
) {

  package { 'openjdk-7-jre':
    ensure => $version,
  }

}
