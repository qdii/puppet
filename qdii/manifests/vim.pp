class qdii::vim {
  package { 'vim':
    ensure => 'latest',
    name => 'vim',
  }
  User <| title == me |> ->
  file { 'vimrc':
    ensure => file,
    path => '/home/qdii/.vimrc',
    source => 'puppet:///modules/qdii/dotfiles/vimrc',
    mode => '0600',
  }
}
