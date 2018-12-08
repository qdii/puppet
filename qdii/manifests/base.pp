class qdii::base {
    # Command line
    package { [
        'aurutils',
        'curl',
        'exa',
        'feh',
        'git',
        'irssi',
        'lsof',
        'nmap',
        'openvpn',
        'pygmentize',
        'tmux',
        'tcpdump',
        'traceroute',
    ]:
      ensure => installed
    }

    # Desktop
    package { [
        'audacity',
        'fcitx',
        'firefox',
        'gimp-git',
        'pulseaudio',
        'pulseaudio-bluetooth',
        'rofi',
        'rxvt-unicode',
        'vlc',
    ]:
      ensure => installed
    }
}
