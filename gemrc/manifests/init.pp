class gemrc {

  file { '/root/.gemrc':
    content => template('gemrc/gemrc'),
    owner => root,
    group => root,
  }

}
