class qdii::base {
    # Command line
    package { [
        'curl',
        'feh',
        'fwupd',
        'git',
        'irssi',
        'ipcalc',
        'lsof',
        'nmap',
        'net-tools',
        'openvpn',
        'pygmentize',
        'tmux',
        'tcpdump',
        'traceroute',
    ]:
      ensure => installed
    }

    if $::operatingsystem == 'Archlinux' {
      package { [
          'aurutils',
      ]:
        ensure =>  installed
      }
    }

    # Desktop
    package { [
        'acpi',
        'audacity',
        'fcitx',
        'firefox',
        'gimp',
        'nextcloud-client',
        'pulseaudio',
        'pulseaudio-bluetooth',
        'rofi',
        'rxvt-unicode',
        'vlc',
        'xorg-xev',
    ]:
      ensure => installed
    }
}
