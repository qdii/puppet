class qdii::user {
  group { 'qdii':
    ensure => 'present',
  }
  group { 'wheel':
    ensure => 'present'
  }
  group { 'lp':
    ensure => 'present'
  }
  @user { 'me':
    ensure     => 'present',
    name       => 'qdii',
    groups     => [
      'qdii',
      'wheel',
      'lp',
    ],
    shell      => '/bin/zsh',
    membership => minimum,
    require    => [
      Group['qdii'],
      Group['wheel'],
      Group['lp'],
      Package['zsh'],
    ],
  }
  user { 'root':
    shell => '/bin/zsh',
  }
}
