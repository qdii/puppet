class qdii::arch {
  User <| title == me |> {
    require =>  Package['docker'],
    groups +> 'docker',
  }
  file { 'custom':
    ensure  => file,
    path    => '/etc/pacman.d/custom',
    source  => 'puppet:///modules/qdii/dotfiles/custom',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }
  file { 'pacman.conf':
    ensure  => file,
    path    => '/etc/pacman.d/pacman.conf',
    source  => 'puppet:///modules/qdii/dotfiles/pacman.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }
  file { 'repoctl-source':
    source         => 'https://github.com/cassava/repoctl/releases/download/v0.18/repoctl-0.18.tar.gz',
    path           => '/tmp/repoctl-0.18.tar.gz',
    checksum       => 'sha256',
    checksum_value => 'f7e7b850a60f86ab5b2601e834b872197efffe034b45488cccb949c138af18b5',
  }
  file { 'custom_directory':
    ensure => 'directory',
    path   => '/var/cache/pacman/custom',
    owner  => User['me'],
  }
  package { 'repoctl':
    ensure          => installed,
    name            => File['repoctl-source']['path'],
    require         => File['repoctl-source'],
    provider        => 'pacman',
    install_options => '-U',
  }
  exec { 'create-custom-repo':
    command => '/usr/bin/repo-add /var/cache/pacman/custom/custom.db.tar',
    require =>  [
      File['pacman.conf', 'custom', 'custom_directory'],
      Package['repoctl'],
    ]
  }
}

