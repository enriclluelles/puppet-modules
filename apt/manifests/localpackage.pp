# Defines a deb package to download and put into the local apt repository.
# Requires that you set an url.
define apt::localpackage(
  $url,
) {

  $repodir = '/var/cache/local-repo'
  $url_tokens = split($url, '/')
  $pkg_filename = $url_tokens[-1]

  file { $repodir:
    ensure => directory,
    mode => '0755',
  }

  exec { 'apt-update-local-repo':
    cwd => $repodir,
    command => '/usr/bin/apt-ftparchive packages . > Packages',
    notify => Exec['apt-update'],
    require => [
      File['/etc/apt/sources.list.d/apt-local-repo.list'],
    ],
  }

  exec { "apt-localpackage-${name}":
    command => "/usr/bin/curl -L -s -C - -O ${url}",
    cwd => $repodir,
    creates => "${repodir}/${pkg_filename}",
    notify => Exec["apt-update-local-repo"],
    require => [
      File[$repodir],
      Package['curl'],
    ],
  }

  if ! defined(Package['curl']) { package { 'curl': } }

  file { '/etc/apt/sources.list.d/apt-local-repo.list':
    content => "deb [trusted=yes] file:${repodir} /",
  }

}
