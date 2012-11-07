class heroku {

    package { 'heroku':
        ensure => 'installed',
        provider => 'gem',
    }

}
