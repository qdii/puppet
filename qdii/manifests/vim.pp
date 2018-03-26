class qdii::vim {
  File {
    ensure => file,
    owner  => 'qdii',
    group  => 'qdii',
    mode   => '0600',
  }
  package { 'vim':
    ensure => 'latest',
    name => 'vim',
  }
  User <| title == me |> ->
  file { 'vimrc':
    path => '/home/qdii/.vimrc',
    source => 'puppet:///modules/qdii/dotfiles/vimrc',
  }
}
