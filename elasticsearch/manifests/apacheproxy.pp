class elasticsearch::apacheproxy(
  $server_name = 'elasticsearch',
  $htpasswd_filename = '/etc/apache2/elasticsearch.htpasswd',
) {

  apache::site { 'elasticsearch':
    content => template('elasticsearch/elasticsearch-apache.conf.erb')
  }

  apache::module { 'proxy':
    conf => false,
  }

  apache::module { 'proxy_http':
    conf => false,
  }

}

