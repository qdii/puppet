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
  file { 'Xresources.dark':
    ensure  => file,
    path    => '/home/qdii/.Xresources.dark',
    source  => 'puppet:///modules/qdii/dotfiles/Xresources.dark',
    owner   => 'qdii',
    group   => 'qdii',
    mode    => '0600',
  }
}
