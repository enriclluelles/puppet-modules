# name should be a nice key, like percona, or brightbox
# source should be: "deb url $lsbdistcodename main"
# gpg_key_id is a gpg key to import, can be left empty
define apt::source($source = "", $gpg_key_id = "") {
  file { "/etc/apt/sources.list.d/${name}.list":
    content => "# This file is managed by Puppet\n$source",
    notify => Exec["apt-update"]
  }

  if $gpg_key_id {
    # Allow multiple definitions of same key - it's not a problem and
    # could be a common ocurrence
    apt::key { "${name}${gpg_key_id}": id => $gpg_key_id }
    Apt::Key["${name}${gpg_key_id}"] -> File["/etc/apt/sources.list.d/${name}.list"]
  }
}

