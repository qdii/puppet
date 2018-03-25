class qdii::xorg {
  package { 'xorg-server':
    ensure => 'latest',
    name => 'xorg-server',
  }
  file { 'xinitrc':
    ensure  => file,
    path    => '/home/qdii/.xinitrc',
    source  => 'puppet:///modules/qdii/dotfiles/xinitrc',
    owner   => 'qdii',
    group   => 'qdii',
    mode    => '0600',
  }
  file { 'Xresources':
    ensure  => file,
    path    => '/home/qdii/.Xresources',
    source  => 'puppet:///modules/qdii/dotfiles/Xresources',
    owner   => 'qdii',
    group   => 'qdii',
    mode    => '0600',
  }
}
