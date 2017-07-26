class qdii::base {
    package { [
        'audacity',
        'aurutils',
        'curl',
        'firefox',
        'gimp-git',
        'git',
        'irssi',
        'lsof',
        'nmap',
        'openvpn',
        'tmux',
        'tcpdump',
        'traceroute',
        'xorg-server',
        'vlc',]:
      ensure => installed
    }
}
