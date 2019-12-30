class qdii::picom {
  if $::fqdn =~ /.*\.roam\.corp\.google\.com/ {
    $homedir = '/home/qdii'
  }
  elsif $::fqdn =~ /^.*\.corp\.google\.com$/ {
    $homedir = '/usr/local/google/home/qdii'
  }
  else {
    $homedir = '/home/qdii'
  }

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
    path   => "${homedir}/.config",
    ensure => 'directory',
    mode   => '0600',
  }
  -> file { 'picom_config_directory':
    ensure => 'directory',
    path   => "${homedir}/.config/$pkg",
    mode   => '0600',
  }
  file { 'picom.conf':
    ensure  => file,
    path    => "${homedir}/.config/$pkg/$pkg.conf",
    source  => 'puppet:///modules/qdii/dotfiles/picom.conf',
    mode    => '0600',
    require =>  File['picom_config_directory'],
  }
}
