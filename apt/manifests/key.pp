# id should be the 8 character hex string that represents the key (is
# actually the last 8 characters of the fingeprint)
define apt::key($id) {
  exec { "apt-key-$name":
    command => "/usr/bin/apt-key adv --keyserver hkp://keys.gnupg.net --recv-keys $id",
    unless => "/usr/bin/apt-key list | /bin/grep $id",
    notify => Exec["apt-update"]
  }
}

