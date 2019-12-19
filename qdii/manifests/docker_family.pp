if $::operatingsystem == 'Ubuntu' {
  class { 'docker':
    ensure       => latest,
    docker_users =>  ['qdii'],
  }

  class { 'docker::compose':
    ensure => latest,
  }
}

class qdii::docker_family {
  if $::operatingsystem == 'Archlinux' {
    package { 'polkit':
      ensure => 'latest',
    }
    package { 'docker':
      ensure  => 'latest',
      require => Package['polkit'],
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
}
