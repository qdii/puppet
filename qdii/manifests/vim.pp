class qdii::vim {
  File {
    ensure => file,
    owner  => 'qdii',
    group  => 'qdii',
    mode   => '0600',
  }
  package { 'vim':
    ensure => 'latest',
    name => 'vim',
  }
  if $::fqdn =~ /.*\.roam\.corp\.google\.com$/ {
    file { 'vimrc':
      ensure =>  file,
      path   => "$qdii::homedir/.vimrc",
      source => 'puppet:///modules/qdii/dotfiles/vimrc',
    }
  }
  elsif $::fqdn =~ /.*\.corp\.google\.com$/ {
    file { 'vimrc':
      ensure =>  file,
      path   => "$qdii::homedir/.vimrc",
      source => 'puppet:///modules/qdii/dotfiles/vimrc_google',
    }
  }
  else {
    file { 'vimrc':
      ensure => file,
      path   => "$qdii::homedir/.vimrc",
      source => 'puppet:///modules/qdii/dotfiles/vimrc',
    }
  }
}
