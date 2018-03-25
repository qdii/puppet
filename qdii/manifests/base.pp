class qdii::base {
    package { [
        'audacity',
        'aurutils',
        'curl',
        'exa',
        'fcitx',
        'feh',
        'firefox',
        'gimp-git',
        'git',
        'irssi',
        'lsof',
        'nmap',
        'openvpn',
        'rxvt-unicode',
        'tmux',
        'tcpdump',
        'traceroute',
        'xorg-server',
        'vlc',]:
      ensure => installed
    }
}
