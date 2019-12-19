class qdii {
  include qdii::arch
  include qdii::base
  include qdii::picom
  if $::operatingsystem == 'Ubuntu' {
    class { 'docker':
      ensure       => latest,
      docker_users =>  ['qdii'],
    }
    class { 'docker::compose':
      ensure => latest,
    }
  }
  include qdii::docker_family
  #  include qdii::dunst
  #  include qdii::i3
  include qdii::user
  include qdii::vim
  #  include qdii::virtualbox
  #  include qdii::wireshark
  #  include qdii::xorg
  include qdii::zsh

  User <| title == me |>
}
