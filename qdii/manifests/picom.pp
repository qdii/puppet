class qdii::picom {
  $pkg = $::operatingsystem ? {
    'Archlinux' => 'picom',
    'Ubuntu'    => 'compton',
    'Debian'    => 'compton',
  }
  package { $pkg:
    ensure => 'latest',
  }
  User <| title == me |>
  -> file { "config_dir":
    path   => "${qdii::homedir}/.config",
    ensure => 'directory',
    mode   => '0600',
  }
  -> file { 'picom_config_directory':
    ensure => 'directory',
    path   => "${qdii::homedir}/.config/$pkg",
    mode   => '0600',
  }
  file { 'picom.conf':
    ensure  => file,
    path    => "${qdii::homedir}/.config/$pkg/$pkg.conf",
    source  => 'puppet:///modules/qdii/dotfiles/picom.conf',
    mode    => '0600',
    require =>  File['picom_config_directory'],
  }
}
