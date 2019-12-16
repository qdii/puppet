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

  # zsh-autosuggestion
  if ::operatingsystem == 'Ubuntu' {
    include ::wget
    wget::fetch { "https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_${lsbdistrelease}/Release.key":
      destination => '/tmp/OhMyZshReleaseKey.key',
    }
    -> exec { 'apt-key add - < /tmp/OhMyZshReleaseKey.key':
    }
    -> package { 'zsh-autosuggestions':
    }
  }
}
