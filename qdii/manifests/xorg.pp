class qdii::xorg {
  File {
    ensure => file,
    owner  => 'qdii',
    group  => 'qdii',
    mode   => '0600',
  }
  package { 'xorg-server':
    ensure => 'latest',
    name   => 'xorg-server',
  }
  file { 'xinitrc':
    path   => '$qdii::homedir/.xinitrc',
    source => 'puppet:///modules/qdii/dotfiles/xinitrc',
  }
  file { 'Xresources':
    path   => '$qdii::homedir/.Xresources',
    source => 'puppet:///modules/qdii/dotfiles/Xresources',
  }
  file { 'Xresources.dark':
    path   => '$qdii::homedir/.Xresources.dark',
    source => 'puppet:///modules/qdii/dotfiles/Xresources.dark',
  }
  file { 'xprofile':
    path   => '$qdii::homedir/.xprofile',
    source => 'puppet:///modules/qdii/dotfiles/xprofile',
  }
}
