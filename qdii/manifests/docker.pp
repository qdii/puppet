class qdii::docker {
  $polkit = $::operatingsystem ? {
    'Archlinux' => 'polkit',
    'Ubuntu'    => 'polkit-1',
  }
  package { $polkit:
    ensure => 'latest',
    alias  => 'policykit',
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
