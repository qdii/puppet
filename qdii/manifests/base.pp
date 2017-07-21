class qdii::base {
    package { [
        'audacity',
        'aurutils',
        'curl',
        'firefox',
        'gimp-git',
        'git',
        'irssi',
        'nmap',
        'openvpn',
        'tmux',
        'traceroute',
        'xorg-server',
        'vlc',]:
      ensure => installed
    }
}
