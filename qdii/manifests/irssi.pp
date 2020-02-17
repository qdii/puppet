class qdii::irssi {
  File {
    ensure => file,
    owner  => 'qdii',
    group  => 'qdii',
    mode   => '0600',
  }
  package { 'irssi':
    ensure => 'latest',
    name => 'irssi',
  }
  file { 'irssi-directory':
    ensure => 'directory',
    path   => '/home/qdii/.irssi',
  }
  file { 'irssi-config':
    ensure  =>  file,
    path    => '/home/qdii/.irssi/config',
    source  => 'puppet:///modules/qdii/dotfiles/irssi-config',
    require => File['irssi-directory'],
  }
  file { 'irssi-solarized-theme':
    ensure =>  file,
    path   => '/home/qdii/.irssi/solarized-universal.theme',
    source => 'puppet:///modules/qdii/misc/solarized-universal.theme',
    require => File['irssi-directory'],
  }
}
