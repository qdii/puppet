class qdii::docker {
  package { 'policykit':
    ensure => 'latest',
    name   => 'policykit',
  }
  package { 'docker':
    ensure  => 'latest',
    name    => 'docker',
    require => Package['policykit'],
  }
  package { 'docker-compose':
    ensure  => 'latest',
    name    => 'docker-compose',
    require => Package['docker']
  }
  @user { 'me':
    ensure => 'present',
    name   => 'qdii',
    groups => [
      'docker'
    ]
  }
}
