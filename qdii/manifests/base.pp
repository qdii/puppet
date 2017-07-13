class qdii::base {
    package { [
        'audacity',
        'curl',
        'firefox',
        'gimp-git',
        'irssi',
        'nmap',
        'openvpn',
        'tmux',
        'traceroute',
        'virtualbox',
        'virtualbox-host-modules-arch',]:
      ensure => installed
    }
}
