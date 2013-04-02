class base::network_tools {

  # How to test network throughtput rate between two machines:
  #
  # Server A:
  #
  #     iperf -s -B <server_ip>
  #
  # Server B:
  #
  #     iperf -c <server_ip> -d -t 60 -i 10
  #
  package { 'iperf':
    ensure => installed,
  }

  package { 'lftp':
    ensure => installed,
  }

}
