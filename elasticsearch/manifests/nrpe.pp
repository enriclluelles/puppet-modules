class elasticsearch::nrpe {

  nagios::nrpe_config { 'elasticsearch':
    content => template('elasticsearch/es-nrpe.conf.erb')
  }

}
