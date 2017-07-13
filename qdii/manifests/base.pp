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
        'virtualbox-host-modules-arch',
        'wireshark-cli',
        'wireshark-common',
        'wireshark-gtk',]:
      ensure => installed
    }
}
