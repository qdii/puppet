class qdii::compton {
  package { 'compton':
    ensure => 'latest',
    name => 'compton',
  }
  User <| title == me |> ->
  file { 'compton.conf':
    ensure => file,
    path => '/home/qdii/.config/compton.conf',
    source => 'puppet:///modules/qdii/dotfiles/compton.conf',
    mode => '0600',
  }
}
