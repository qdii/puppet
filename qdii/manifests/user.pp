class qdii::user {
  group { 'qdii':
    ensure => 'present',
  }
  group { 'wheel':
    ensure => 'present'
  }
  @user { 'me':
    ensure => 'present',
    name => 'qdii',
    groups => ['qdii', 'wheel'],
    membership => minimum,
    require => [
      Group['qdii'],
      Group['wheel'],
    ],
  }
}
