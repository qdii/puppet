class qdii::docker {
  package { 'policykit':
    ensure => 'latest',
    name   => 'polkit',
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
  User <| title == me |> {
    require =>  Package['docker'],
    groups +> 'docker',
  }
}
