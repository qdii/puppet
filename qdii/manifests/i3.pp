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
  if $::operatingsystem == 'Debian' {
    file { 'i3blocks-binary':
      ensure => 'file',
      require => Package['i3blocks'],
      path => '/usr/bin/i3blocks',
      source  => 'puppet:///modules/qdii/misc/i3blocks',
    }
  }
  if $::operatingsystem == 'ArchLinux' {
    package { 'i3lock-color-git':
      ensure => 'latest',
      name => 'i3lock-color-git',
      require => Package['i3'],
    }
  }
  file { 'i3-config-directory':
    ensure => 'directory',
    owner => 'qdii',
    mode => '0600',
    path => "$qdii::homedir/.i3",
  }
  file { 'i3-new-config-directory':
    ensure => 'directory',
    owner => 'qdii',
    mode => '0600',
    path => "$qdii::homedir/.config/i3",
  }

  if $::fqdn =~ /.*\.corp\.google\.com/ {
      $i3suffix = '.work'
  } else {
      $i3suffix = '.perso'
  }
  file { 'i3-new-config':
    path    => "$qdii::homedir/.config/i3/config",
    source  => "puppet:///modules/qdii/dotfiles/i3config${i3suffix}",
    owner   => 'qdii',
    mode    => '0600',
    require =>  File['i3-new-config-directory'],
  }
  file { 'i3config':
    ensure  => file,
    path    => "$qdii::homedir/.i3/config",
    source  => "puppet:///modules/qdii/dotfiles/i3config${i3suffix}",
    owner   => 'qdii',
    mode    => '0600',
    require =>  File['i3-config-directory'],
  }
  file { 'i3blocks':
    ensure => file,
    path => "$qdii::homedir/.i3blocks.conf",
    source => "puppet:///modules/qdii/dotfiles/i3blocks${i3suffix}",
    owner => 'qdii',
    mode => '0600',
  }
  file { 'i3get':
    ensure => file,
    path => '/usr/local/bin/i3get',
    source => 'puppet:///modules/qdii/misc/i3get',
    owner => 'qdii',
    mode => '0777',
  }
  file { 'anypaste':
    ensure => file,
    path => '/usr/local/bin/anypaste',
    source => 'puppet:///modules/qdii/misc/anypaste',
    owner => 'qdii',
    mode => '0777',
  }
  file { 'i3cast':
    ensure  => file,
    path    => '/usr/local/bin/i3cast',
    source  => 'puppet:///modules/qdii/misc/i3cast',
    owner   => 'qdii',
    mode    => '0777',
    require => File['anypaste'],
  }
  file { 'i3run':
    ensure => file,
    path => '/usr/local/bin/i3run',
    source => 'puppet:///modules/qdii/misc/i3run',
    owner => 'qdii',
    mode => '0777',
  }
}
