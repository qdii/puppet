class qdii::base {
    package { [
        'audacity',
        'aurtools',
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
