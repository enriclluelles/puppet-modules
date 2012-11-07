# Adapted from https://github.com/camptocamp/puppet-apt primarily to
# support their postgresql recipe.
define apt::preferences(
  $ensure = 'present',
  $package= '',
  $pin,
  $priority,
) {

  $pkg = $package ? {
    '' => $name,
    default => $package,
  }

  $fname = regsubst($name, '\.', '-', 'G')

  file { "/etc/apt/preferences.d/${fname}":
    ensure => $ensure,
    owner => root,
    group => root,
    mode => 644,
    content => template('apt/preferences.erb'),
    before => Exec["apt-update"],
    notify => Exec["apt-update"],
  }

}
