class qdii::base {
    # Command line
    package { [
        'curl',
        'fakeroot',
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

    # Locale
    package { 'sed':
      ensure =>  installed,
    }
    -> exec { 'enable-locale':
      command => 'sed -i "/^#en_US.*/s/^#//" /etc/locale.gen',
      unless  => 'locale -a | grep -i en_US.utf8',
      path    => '/usr/bin',
    }
    -> exec { 'regenerate-locale':
      command => 'locale-gen',
      path    => '/usr/bin',
    }

    package { 'sudo':
      ensure =>  latest,
    }
    file { '/etc/sudoers':
      ensure =>  file,
      source => 'puppet:///modules/qdii/dotfiles/sudoers',
    }
}
