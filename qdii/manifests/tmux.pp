class qdii::tmux {
  if $::fqdn =~ /.*\.roam\.corp\.google\.com/ {
    $homedir = '/home/qdii'
  }
  elsif $::fqdn =~ /^.*\.corp\.google\.com$/ {
    $homedir = '/usr/local/google/home/qdii'
  }
  else {
    $homedir = '/home/qdii'
  }

  package { 'tmux':
    ensure => latest,
  }
  -> file { 'tmux_conf_qdii':
    ensure => file,
    source => 'puppet:///modules/qdii/dotfiles/tmux',
    path   => "${homedir}/.tmux.conf",
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
