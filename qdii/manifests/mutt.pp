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
  file { 'mutt-solarized':
    ensure => file,
    path => '/home/qdii/.mutt/mutt-colors-solarized-dark-256.muttrc',
    source => 'puppet:///modules/qdii/dotfiles/misc/mutt-colors-solarized-dark-256.muttrc',
    mode => '0644',
  }
}
