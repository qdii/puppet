class qdii::firefox {
  package { 'firefox':
    ensure => 'latest',
    name => 'firefox',
  }
}
