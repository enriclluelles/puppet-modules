class heroku {

  exec { 'heroku-toolbelt':
    command => 'wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh',
    unless => 'test -f /etc/apt/sources.list.d/heroku.list',
    user => root,
  }

}
