# discovery_hosts should be a an array of hostnames or IPs of other masters
#
# Will automatically download debs for versions >= 0.19.  For older
# versions, you must provide a url to the appropriate deb file using
# the deburl parameter (you still need to provide the right $version
# parameter too).
#
# To run a client-only server, set $master and $data to false
#
# On Lucid it currently requires a manual step to install the package
# as Lucid apt-get doesn't support trusted=yes parameter
#
class elasticsearch(
  $version = '0.19.11',
  $heap_size = '1024m',
  $cluster_name = 'elasticsearch',
  $discovery_hosts = [],
  $minimum_master_nodes = 1,
  $deburl = false,
  $master = true,
  $data = true,
) {

  package { 'default-jre-headless':
    ensure => installed,
  }

  file { 'elasticsearch-local-repo':
    ensure => directory,
    mode => '0755',
    path => '/var/cache/local-repo',
  }

  exec { "download-elastic-search":
    command => "/usr/bin/curl -L -s -C - -O http://cloud.github.com/downloads/elasticsearch/elasticsearch/elasticsearch-${version}.deb",
    cwd => '/var/cache/local-repo',
    creates => "/var/cache/local-repo/elasticsearch-${version}.deb",
    require => Package['curl'],
  }

  exec { 'install-elastic-search':
    command => "/usr/bin/dpkg -i elasticsearch-${version}.deb",
    cwd => '/var/cache/local-repo',
    creates => '/usr/share/elasticsearch/bin/elasticsearch',
    require => Exec['download-elastic-search'],
  }

  package { 'elasticsearch':
    ensure => $version,
  }

  service { 'elasticsearch':
    ensure => true,
    enable => true,
    require => Package[elasticsearch],
    hasstatus => true,
    hasrestart => true
  }

  file { "/etc/default/elasticsearch":
    content => template("elasticsearch/default-elasticsearch.erb"),
    notify => Service[elasticsearch]
  }

  file { "/etc/elasticsearch":
    ensure => directory,
    require => Package[elasticsearch]
  }

  file { "/etc/elasticsearch/elasticsearch.yml":
    content => template("elasticsearch/elasticsearch.yml.erb"),
    notify => Service[elasticsearch],
    require => [Package[elasticsearch], File["/etc/elasticsearch"]]
  }

  file { "/etc/elasticsearch/logging.yml":
    content => template("elasticsearch/logging.yml.erb"),
    notify => Service[elasticsearch],
    require => [Package[elasticsearch], File["/etc/elasticsearch"]]
  }

  if tagged("nrpe") {
    include elasticsearch::nrpe
  }
}
