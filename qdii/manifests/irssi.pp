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
  file { 'irssi-config':
    ensure =>  file,
    path   => '/home/qdii/.irssi/config',
    source => 'puppet:///modules/qdii/dotfiles/irssi-config',
  }
  file { 'irssi-solarized-theme':
    ensure =>  file,
    path   => '/home/qdii/.irssi/solarized-universal.theme',
    source => 'puppet:///modules/qdii/misc/solarized-universal.theme',
  }
}
