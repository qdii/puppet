class qdii::mutt {
  if $qdii::at_work == false {
      package { 'mutt':
        ensure => 'latest',
        name => 'mutt',
      }
      User <| title == me |> ->
      file { 'muttdir':
        ensure => directory,
        owner  => 'qdii',
        path   => "$qdii::homedir/.mutt",
      }
      file { 'muttrc':
        ensure => file,
        path => "$qdii::homedir/.muttrc",
        source => 'puppet:///modules/qdii/dotfiles/muttrc',
        mode => '0600',
      }
      file { 'mailcap':
        ensure  => file,
        path    => "$qdii::homedir/.mutt/mailcap",
        source  => 'puppet:///modules/qdii/misc/mailcap',
        mode    => '0600',
        require => File['muttdir'],
      }
      file { 'mutt-solarized':
        ensure => file,
        path => "$qdii::homedir/.mutt/mutt-colors-solarized-dark-256.muttrc",
        source => 'puppet:///modules/qdii/misc/mutt-colors-solarized-dark-256.muttrc',
        mode => '0644',
      }
      file { 'offlineimaprc':
        ensure => file,
        path   => "$qdii::homedir/.offlineimaprc",
        source => 'puppet:///modules/qdii/dotfiles/offlineimaprc',
        mode   => '0600'
      }
  }
}
