class qdii {
  package { 'vim':
    ensure => 'latest',
    name => 'vim',
  }
  file { 'vimrc':
    ensure => file,
    path => '/home/qdii/.vimrc',
    source => 'puppet:///modules/qdii/dotfiles/vimrc',
    mode => '0600',
  }
}
