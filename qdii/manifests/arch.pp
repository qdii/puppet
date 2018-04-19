class qdii::arch {
  file { 'custom':
    ensure  => file,
    path    => '/etc/pacman.d/custom',
    source  => 'puppet://modules/qdii/dotfiles/custom',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }
}
