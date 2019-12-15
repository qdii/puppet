class qdii::picom {
  package { 'picom':
    ensure => 'latest',
  }
  User <| title == me |> ->
  file { '/home/qdii/.config/picom':
    ensure => 'directory',
    mode   => '0600',
    alias  => 'picom_config_directory',
  }
  file { 'picom.conf':
    ensure  => file,
    path    => '/home/qdii/.config/picom/picom.conf',
    source  => 'puppet:///modules/qdii/dotfiles/picom.conf',
    mode    => '0600',
    require =>  File['picom_config_directory'],
  }
}
