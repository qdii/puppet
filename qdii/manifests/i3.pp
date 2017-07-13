class qdii::i3 {
  package { 'i3':
    ensure => 'latest',
    name => 'i3-wm',
  }
  package { 'i3blocks':
    ensure => 'latest',
    name => 'i3blocks',
    require => Package['i3'],
  }
  package { 'i3lock':
    ensure => 'latest',
    name => 'i3lock',
    require => Package['i3'],
  }
  file { 'i3config':
    ensure => file,
    path => '/home/qdii/.i3/config',
    source => 'puppet:///modules/qdii/dotfiles/i3config',
    mode => '0600',
  }
  file { 'i3blocks':
    ensure => file,
    path => '/home/qdii/.i3blocks.conf',
    source => 'puppet:///modules/qdii/dotfiles/i3blocks',
    mode => '0600',
  }
}
