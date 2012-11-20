class autoenv {

  include python

  package { 'autoenv':
    provider => pip,
    ensure   => latest,
    require  => Package['python-pip'],
  }

}
