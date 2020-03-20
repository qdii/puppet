class qdii::clipmenu {
  if $::operatingsystem == 'ArchLinux' {
      package { 'clipmenu':
        ensure => 'latest',
        name => 'clipmenu',
      }
  }
  else {
    file { 'clipmenu-bin':
      ensure => 'file',
      owner => 'qdii',
      mode => '0700',
      path => '/usr/bin/clipmenu',
      source  => 'puppet:///modules/qdii/clipmenu/clipmenu',
    }
    file { 'clipmenud':
      ensure => 'file',
      owner => 'qdii',
      mode => '0700',
      path => '/usr/bin/clipmenud',
      source  => 'puppet:///modules/qdii/clipmenu/clipmenud',
    }
    file { 'clipfsck':
      ensure => 'file',
      owner => 'qdii',
      mode => '0700',
      path => '/usr/bin/clipfsck',
      source  => 'puppet:///modules/qdii/clipmenu/clipfsck',
    }
    file { 'clipdel':
      ensure => 'file',
      owner => 'qdii',
      mode => '0700',
      path => '/usr/bin/clipdel',
      source  => 'puppet:///modules/qdii/clipmenu/clipdel',
    }
  }
  file { 'clipmenud.service':
    ensure => 'file',
    owner => 'root',
    mode => '644',
    path => '/usr/lib/systemd/user/clipmenud.service',
    source  => 'puppet:///modules/qdii/clipmenu/clipmenud.service',
  }
}
