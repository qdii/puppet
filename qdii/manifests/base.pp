class qdii::base {
    package { [
        'firefox',
        'nmap',
        'tmux',
        'irssi',
        'openvpn',
        'gimp-git',
        'audacity',
        'virtualbox',
        'virtualbox-host-modules-arch',]:
      ensure => installed
    }
}
