class qdii::arch {
  if $::operatingsystem == 'Archlinux' {
    file { 'custom':
      ensure  => file,
      path    => '/etc/pacman.d/custom',
      source  => 'puppet:///modules/qdii/dotfiles/custom',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
    file { 'pacman.conf':
      ensure  => file,
      path    => '/etc/pacman.d/pacman.conf',
      source  => 'puppet:///modules/qdii/dotfiles/pacman.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
    file { 'custom_directory':
      ensure => 'directory',
      path   => '/var/cache/pacman/custom',
      owner  => 'qdii',
    }
    package { 'repoctl':
      ensure          => installed,
      source          => 'https://github.com/cassava/repoctl/releases/download/v0.18/repoctl-0.18.tar.gz',
      provider        => 'pacman',
    }
    exec { 'create-custom-repo':
      command => '/usr/bin/repo-add /var/cache/pacman/custom/custom.db.tar',
      require =>  [
        File['pacman.conf', 'custom', 'custom_directory'],
        Package['repoctl'],
      ]
    }
  }
}
