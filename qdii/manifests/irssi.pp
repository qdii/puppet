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
      path   => "$qdii::homedir/.irssi",
    }
  if "$qdii::at_work" == false {
      file { 'irssi-config':
        ensure  =>  file,
        path    => "$qdii::homedir/.irssi/config",
        source  => 'puppet:///modules/qdii/dotfiles/irssi-config',
        require => File['irssi-directory'],
      }
      file { 'irssi-solarized-theme':
        ensure =>  file,
        path   => "$qdii::homedir/.irssi/solarized-universal.theme",
        source => 'puppet:///modules/qdii/misc/solarized-universal.theme',
        require => File['irssi-directory'],
      }
    }
}
