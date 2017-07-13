class qdii::dunst {
  package { 'dunst':
    ensure => 'latest',
    name => 'dunst',
  }
  file { 'dunst-config-directory':
    ensure => 'directory',
    owner => 'qdii',
    group => 'qdii',
    mode => '0600',
    path => '/home/qdii/.config/dunst',
  }
  file { 'dunstrc':
    ensure => file,
    path => '/home/qdii/.config/dunst/dunstrc',
    source => 'puppet:///modules/qdii/dotfiles/dunstrc',
    mode => '0600',
    require => File['dunst-config-directory'],
  }
}
