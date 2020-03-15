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
  package { 'i3lock-color-git':
    ensure => 'latest',
    name => 'i3lock-color-git',
    require => Package['i3'],
  }
  file { 'i3-config-directory':
    ensure => 'directory',
    owner => 'qdii',
    group => 'qdii',
    mode => '0600',
    path => '/home/qdii/.i3',
  }
  -> file { 'i3config':
    ensure  => file,
    path    => '/home/qdii/.i3/config',
    source  => 'puppet:///modules/qdii/dotfiles/i3config',
    owner   => 'qdii',
    group   => 'qdii',
    mode    => '0600',
  }
  file { 'new-config-directory':
    ensure => 'directory',
    owner => 'qdii',
    group => 'qdii',
    mode => '0600',
    path => '/home/qdii/.config',
  }
  -> file { 'i3-new-config-directory':
    ensure => 'directory',
    owner => 'qdii',
    group => 'qdii',
    mode => '0600',
    path => '/home/qdii/.config/i3',
  }
  -> file { 'i3-new-config':
    path    => '/home/qdii/.config/i3/config',
    source  => 'puppet:///modules/qdii/dotfiles/i3config',
    owner   => 'qdii',
    group   => 'qdii',
    mode    => '0600',
    require =>  File['i3-new-config-directory'],
  }
  file { 'i3config':
    ensure  => file,
    path    => '/home/qdii/.i3/config',
    source  => 'puppet:///modules/qdii/dotfiles/i3config',
    owner   => 'qdii',
    group   => 'qdii',
    mode    => '0600',
    require =>  File['i3-config-directory'],
  }
  file { 'i3blocks':
    ensure => file,
    path => '/home/qdii/.i3blocks.conf',
    source => 'puppet:///modules/qdii/dotfiles/i3blocks',
    owner => 'qdii',
    group => 'qdii',
    mode => '0600',
  }
  file { 'i3get':
    ensure => file,
    path => '/usr/local/bin/i3get',
    source => 'puppet:///modules/qdii/misc/i3get',
    owner => 'qdii',
    group => 'qdii',
    mode => '0777',
  }
  file { 'anycast':
    ensure => file,
    path => '/usr/local/bin/anycast',
    source => 'puppet:///modules/qdii/misc/anycast',
    owner => 'qdii',
    group => 'qdii',
    mode => '0777',
  }
  file { 'i3cast':
    ensure  => file,
    path    => '/usr/local/bin/i3cast',
    source  => 'puppet:///modules/qdii/misc/i3cast',
    owner   => 'qdii',
    group   => 'qdii',
    mode    => '0777',
    require => File['anycast'],
  }
  file { 'i3run':
    ensure => file,
    path => '/usr/local/bin/i3run',
    source => 'puppet:///modules/qdii/misc/i3run',
    owner => 'qdii',
    group => 'qdii',
    mode => '0777',
  }
  file { 'anycast':
    ensure => file,
    path => '/usr/local/bin/anycast',
    source => 'puppet:///modules/qdii/misc/anycast',
    owner => 'qdii',
    group => 'qdii',
    mode => '0777',
  }
  file { 'pscircles_bg':
    ensure => file,
    path   => '/usr/local/bin/pscircles_bg',
    source => 'puppet:///modules/qdii/misc/pscircles_bg',
    owner  => 'qdii',
    group  => 'qdii',
    mode   => '0777',
  }
}
