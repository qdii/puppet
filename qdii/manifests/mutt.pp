class qdii::mutt {
  package { 'mutt':
    ensure => 'latest',
    name => 'mutt',
  }
  User <| title == me |> ->
  file { 'muttrc':
    ensure => file,
    path => '/home/qdii/.muttrc',
    source => 'puppet:///modules/qdii/dotfiles/muttrc',
    mode => '0600',
  }
}
