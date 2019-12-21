class qdii::picom {
  $pkg = $::operatingsystem ? {
    'Archlinux' => 'picom',
    'Ubuntu'    => 'compton',
  }
  package { $pkg:
    ensure => 'latest',
  }
  User <| title == me |>
  -> file { "/home/qdii/.config":
    ensure => 'directory',
    mode   => '0600',
  }
  -> file { "/home/qdii/.config/$pkg":
    ensure => 'directory',
    mode   => '0600',
    alias  => 'picom_config_directory',
  }
  file { 'picom.conf':
    ensure  => file,
    path    => "/home/qdii/.config/$pkg/$pkg.conf",
    source  => 'puppet:///modules/qdii/dotfiles/picom.conf',
    mode    => '0600',
    require =>  File['picom_config_directory'],
  }
}
