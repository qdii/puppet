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
      path    => '/etc/pacman.conf',
      source  => "puppet:///modules/qdii/dotfiles/pacman.conf.${::os['architecture']}",
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
    file { 'custom_directory':
      ensure => 'directory',
      path   => '/var/cache/pacman/custom',
      owner  => 'qdii',
    }
    -> package { 'aurutils':
      source  => 'https://aur.archlinux.org/cgit/aur.git/snapshot/aurutils.tar.gz',
      require => File['pacman.conf']
    }
    package { 'go':
      ensure =>  latest,
    }
    exec { 'create-custom-repo':
      command => '/usr/bin/repo-add /var/cache/pacman/custom/custom.db.tar',
      require =>  [
        File['pacman.conf', 'custom', 'custom_directory'],
      ]
    }
  }
}
