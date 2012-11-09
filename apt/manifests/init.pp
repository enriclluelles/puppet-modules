class apt {

  exec { 'apt-update':
    command => '/usr/bin/apt-get update',
    schedule => daily,
    refreshonly => true,
  }

  if ! defined(Package['python-software-properties']) {
    package { 'python-software-properties': ensure => latest }
  }

  # Ensure apt is setup before running apt-get update
  # Apt::Ppa <| |> -> Exec['apt-update']
  # Apt::Key <| |> -> Exec['apt-update']

  # Ensure apt-get update has been run before installing any packages
  # Exec['apt-update'] -> Package <| |>

}
