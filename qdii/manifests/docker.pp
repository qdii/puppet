class qdii::docker {
  if $::operatingsystem == 'Archlinux' {
    package { 'polkit':
      ensure => 'latest',
    }
    package { 'docker':
      ensure  => 'latest',
      require => Package['polkit'],
    }
  }
  if $::operatingsystem == 'Ubuntu' {
    package { 'docker.io':
      ensure  => 'latest',
      alias => 'docker'
    }
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
