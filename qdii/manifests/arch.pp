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
    file { 'blackarch-mirrorlist':
      ensure => file,
      path   => '/etc/pacman.d/blackarch-mirrorlist',
      source => 'puppet:///modules/qdii/misc/blackarch-mirrorlist',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
    file { 'custom_directory':
      ensure => 'directory',
      path   => '/var/cache/pacman/custom',
      owner  => 'qdii',
      group  => 'qdii',
    }
    file { '/tmp/aurutils-2.3.3-1-any.pkg.tar.xz':
      source => 'puppet:///modules/qdii/pkg/aurutils-2.3.3-1-any.pkg.tar.xz'
    }
    -> exec { 'install-aurutils':
      command => 'pacman -U --noconfirm /tmp/aurutils-2.3.3-1-any.pkg.tar.xz',
      unless  => 'pacman -Qi aurutils',
      path    => '/usr/bin',
      require => File['blackarch-mirrorlist'],
    }
    -> package { 'pkgfile':
      ensure => latest,
    }
    exec { 'create-custom-repo':
      command => 'repo-add /var/cache/pacman/custom/custom.db.tar',
      require => [
        File['pacman.conf', 'custom', 'custom_directory'],
      ],
      path    => '/usr/bin',
      user    => 'qdii',
      creates => '/var/cache/pacman/custom/custom.db',
    }
  }
}
