class qdii::base {
    package { [
        #'audacity',
        'aurutils',
        'curl',
        'exa',
        #'fcitx',
        'feh',
        #'firefox',
        #'gimp-git',
        'git',
        'irssi',
        'lsof',
        'nmap',
        'openvpn',
        #'rofi',
        #'rxvt-unicode',
        'tmux',
        'tcpdump',
        'traceroute',
        #'vlc',
    ]:
      ensure => installed
    }
}
