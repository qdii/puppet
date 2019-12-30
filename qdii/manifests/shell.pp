class qdii::shell {
  if $::fqdn =~ '/.*\.roam\.corp\.google\.com' {
    $homedir = '/home/qdii'
  }
  elsif $::fqdn =~ '/.*\.corp\.google\.com' {
    $homedir = '/usr/local/google/home/qdii'
  }
  else {
    $homedir = '/home/qdii'
  }

  package { 'zsh': ensure => latest }
  file { 'zshrc':
    ensure => 'file',
    owner  => 'qdii',
    mode   => '0600',
    source => 'puppet:///modules/qdii/dotfiles/zshrc',
    path   => "${homedir}/.zshrc',
  }

  file { 'root_zshrc':
    ensure => 'file',
    owner  => 'root',
    mode   => '0600',
    source => 'puppet:///modules/qdii/dotfiles/root_zshrc',
    path   => '/root/.zshrc',
  }

  # zsh-autosuggestion
  if ::operatingsystem == 'Ubuntu' {
    include ::wget
    wget::fetch { "https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_${lsbdistrelease}/Release.key":
      destination => '/tmp/OhMyZshReleaseKey.key',
    }
    -> exec { 'apt-key add - < /tmp/OhMyZshReleaseKey.key': }
    -> package { 'zsh-autosuggestions': ensure => latest, }
  }
  else {
    package { 'zsh-autosuggestions': ensure => latest, }
  }

  # Oh my zsh
  exec { 'ohmyzsh_qdii':
    command  => 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"',
    provider => shell,
    creates  => "${homedir}/.oh-my-zsh/",
    path     => '/usr/bin',
    cwd      => $homedir,
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
