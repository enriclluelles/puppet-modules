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
  $version = '0.19.3',
  $heap_size = '1024m',
  $cluster_name = 'elasticsearch',
  $discovery_hosts = [],
  $minimum_master_nodes = 1,
  $deburl = false,
  $master = true,
  $data = true,
) {

  package { 'openjdk-6-jre-headless':
    ensure => installed,
  }

  apt::localpackage { 'elasticsearch':
    url => $deburl ? {
      false => "https://github.com/downloads/elasticsearch/elasticsearch/elasticsearch-${version}.deb",
      default => $deburl
    }
  }

  package { 'elasticsearch':
    ensure => $version,
  }

  service { 'elasticsearch':
    ensure => true,
    enable => true,
    require => Package['elasticsearch'],
    hasstatus => true,
    hasrestart => true
  }

  file { '/etc/default/elasticsearch':
    content => template("elasticsearch/default-elasticsearch.erb"),
    notify => Service['elasticsearch'],
  }

  file { '/etc/elasticsearch':
    ensure => directory,
    require => Package['elasticsearch']
  }

  file { '/etc/elasticsearch/elasticsearch.yml':
    content => template('elasticsearch/elasticsearch.yml.erb'),
    notify => Service['elasticsearch'],
    require => [
      Package['elasticsearch'],
      File['/etc/elasticsearch'],
    ],
  }

  file { '/etc/elasticsearch/logging.yml':
    content => template('elasticsearch/logging.yml.erb'),
    notify => Service[elasticsearch],
    require => [
      Package['elasticsearch'],
      File['/etc/elasticsearch'],
    ],
  }

  if tagged('nrpe') { include elasticsearch::nrpe }

}
