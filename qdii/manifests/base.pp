class qdii::base {
    package { [
        'audacity',
        'curl',
        'firefox',
        'gimp-git',
        'git',
        'irssi',
        'nmap',
        'openvpn',
        'tmux',
        'traceroute',
        'vlc',]:
      ensure => installed
    }
}
