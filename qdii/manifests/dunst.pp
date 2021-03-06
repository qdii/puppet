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
    path => "$qdii::homedir/.config/dunst",
  }
  file { 'dunstrc':
    ensure => file,
    path => "$qdii::homedir/.config/dunst/dunstrc",
    source => 'puppet:///modules/qdii/dotfiles/dunstrc',
    mode => '0600',
    owner => 'qdii',
    group => 'qdii',
    require => File['dunst-config-directory'],
  }
}
