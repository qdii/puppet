class qdii::zsh {
  package { 'zsh':
    ensure => 'latest',
    name   => 'zsh',
  }
  file { 'zshrc':
    ensure => 'file',
    owner  => 'qdii',
    group  => 'qdii',
    mode   => '0600',
    source => 'puppet:///modules/qdii/dotfiles/zshrc',
    path   => '/home/qdii/.zshrc',
  }
}
