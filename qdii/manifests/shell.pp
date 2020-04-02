class qdii::shell {
  if $::fqdn =~ /.*\.roam\.corp\.google\.com/ {
    $brw_path = 'puppet:///modules/qdii/dotfiles/zshrc.browser.work'
  }
  elsif $::fqdn =~ /^.*\.corp\.google\.com$/ {
    $brw_path = 'puppet:///modules/qdii/dotfiles/zshrc.browser.work'
  }
  else {
    $brw_path = 'puppet:///modules/qdii/dotfiles/zshrc.browser.perso'
  }

  package { 'zsh': ensure => latest }
  file { 'zshrc':
    ensure => 'file',
    owner  => 'qdii',
    mode   => '0600',
    source => 'puppet:///modules/qdii/dotfiles/zshrc',
    path   => "${qdii::homedir}/.zshrc",
  }
  file { 'zshrc_browser':
    ensure => 'file',
    owner  => 'qdii',
    mode   => '0600',
    source => "$brw_path",
    path   => "${qdii::homedir}/.zshrc.browser",
  }

  file { 'root_zshrc':
    ensure => 'file',
    owner  => 'root',
    mode   => '0600',
    source => 'puppet:///modules/qdii/dotfiles/zshrc',
    path   => '/root/.zshrc',
  }
  file { 'root_zshrc_browser':
    ensure => 'file',
    owner  => 'root',
    mode   => '0600',
    source => "$brw_path",
    path   => "/root/.zshrc.browser",
  }

  # zsh-autosuggestion
  if $::operatingsystem == 'Ubuntu' {
    package { 'coreutils':
      ensure => 'latest',
    }
    wget::fetch { 'ohmyzsh_key':
      source => "https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_${::lsbdistrelease}/Release.key",
      destination => '/tmp/OhMyZshReleaseKey.key',
    }
    -> exec { 'register-ohmyzsh-key':
      command  => 'apt-key add - < /tmp/OhMyZshReleaseKey.key',
      path     => '/usr/bin:/bin',
      provider => 'shell',
      require  => Package['coreutils'],  # for mktemp
    }
    -> package { 'zsh-autosuggestions': ensure => latest, }
  }
  else {
    package { 'zsh-autosuggestions': ensure => latest, }
  }

  # Oh my zsh
  exec { 'ohmyzsh_qdii':
    command  => 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"',
    provider => shell,
    creates  => "${qdii::homedir}/.oh-my-zsh/",
    path     => '/usr/bin',
    cwd      => $qdii::homedir,
    require => Package['curl'],
  }
  exec { 'ohmyzsh_root':
    command  => 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"',
    provider => shell,
    creates  => '/root/.oh-my-zsh/',
    path     => '/usr/bin',
    cwd      => '/root',
    require => Package['curl'],
  }
}
