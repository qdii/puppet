class qdii {
  include qdii::arch
  include qdii::base
  include qdii::picom
  include qdii::docker_family
  #  include qdii::dunst
  #  include qdii::i3
  include qdii::user
  include qdii::tmux
  include qdii::vim
  #  include qdii::virtualbox
  #  include qdii::wireshark
  #  include qdii::xorg
  include qdii::shell

  User <| title == me |>
}
