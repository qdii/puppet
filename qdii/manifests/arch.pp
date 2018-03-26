include stdlib

class qdii::arch {
  file { 'custom':
    ensure  => file,
    path    => '/etc/pacman.d/custom',
    sources => 'puppet://modules/qdii/dotfiles/custom',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }
  file_line { 'pacman_custom':
    ensure => present,
    line   => 'Include = /etc/pacman.d/custom',
  }
}
