class qdii::base {
    # Command line
    package { [
        'curl',
        'cscope',
        'fakeroot',
        'feh',
        'fwupd',
        'fzf',
        'git',
        'ipcalc',
        'lsof',
        'mosh',
        'nmap',
        'net-tools',
        'openvpn',
        'python-pygments',
        'tcpdump',
        'traceroute',
        'zsh-syntax-highlighting',
    ]:
      ensure => installed
    }

    if $::fqdn == 'limo.dodges.it' {
        package { [
            'acpi',
            'audacity',
            'fcitx',
            'fcitx-libpinyin',
            'fcitx-im',
            'firefox',
            'flameshot',
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

    # Locale
    package { 'sed':
      ensure =>  installed,
    }
    -> exec { 'enable-locale':
      command  => 'sed -i "/^#en_US.*/s/^#//" /etc/locale.gen',
      provider => shell,  # for grep
      unless   => 'locale -a | grep -q en_US.utf8',
      path     => '/usr/bin:/bin',
    }
    -> exec { 'regenerate-locale':
      command  => 'locale-gen',
      provider => shell,  # for grep
      unless   => 'locale -a | grep -q en_US.utf8',
      path     => '/usr/bin:/bin',
    }

    package { 'sudo':
      ensure =>  latest,
    }
    if $::fqdn !~ /.*\.google\.com$/ {
        file { '/etc/sudoers.d/qdii':
            ensure =>  file,
            source => 'puppet:///modules/qdii/dotfiles/sudoers',
        }
        file { '/home/qdii/.ssh/authorized_keys':
            ensure => file,
            source => 'puppet:///modules/qdii/misc/authorized_keys',
        }
    }
    file { '/usr/share/X11/xkb/symbols/fr':
        ensure => file,
        source => 'puppet:///modules/qdii/misc/xkb.fr',
    }
}
