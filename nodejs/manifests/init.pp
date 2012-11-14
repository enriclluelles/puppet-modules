class nodejs(
  $version = latest,
) {

  package { 'nodejs':
    ensure => $version,
  }

  package { 'nodejs-dev':
    ensure => $version,
  }

}
