class qdii {
  include qdii::base
  include qdii::i3
  include qdii::user
  include qdii::vim
  include qdii::virtualbox
  include qdii::wireshark

  User <| title == me |>
}
