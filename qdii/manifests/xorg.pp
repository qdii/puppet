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
    path   => '/home/qdii/.xinitrc',
    source => 'puppet:///modules/qdii/dotfiles/xinitrc',
  }
  file { 'Xresources':
    path   => '/home/qdii/.Xresources',
    source => 'puppet:///modules/qdii/dotfiles/Xresources',
  }
  file { 'Xresources.dark':
    path   => '/home/qdii/.Xresources.dark',
    source => 'puppet:///modules/qdii/dotfiles/Xresources.dark',
  }
}
