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
        'mosh',
        'nmap',
        'net-tools',
        'openvpn',
        'tmux',
        'tcpdump',
        'traceroute',
    ]:
      ensure => installed
    }

    if $::operatingsystem == 'Archlinux' {
      package { [
          'pygmentize',
      ]:
        ensure =>  installed
      }
    }

    if $::operatingsystem == 'Ubuntu' {
      package { [
          'python-pygments',
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
