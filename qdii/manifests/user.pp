class qdii::user {
  @user { 'me':
    ensure => 'present',
    name => 'qdii',
    groups => ['qdii', 'wheel'],
    membership => minimum,
  }
}
