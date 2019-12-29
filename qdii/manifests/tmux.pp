class qdii::tmux {
  package { 'tmux':
    ensure => latest,
  }
  -> file { 'tmux_conf_qdii':
    ensure => file,
    source => 'puppet:///modules/qdii/dotfiles/tmux',
    path   => '/home/qdii/.tmux.conf',
    owner  => 'qdii',
    group  => 'qdii',
  }
  -> file { 'tmux_conf_root':
    ensure => file,
    source => 'puppet:///modules/qdii/dotfiles/tmux',
    path   => '/root/.tmux.conf',
    owner  => 'root',
    group  => 'root',
  }
}
