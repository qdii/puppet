class qdii {
  if $::fqdn =~ /.*roam\.corp\.google\.com/ {
    $homedir = '/home/qdii'
    $at_work = true
    $limo = false
  }
  elsif $::fqdn =~ /.*\.corp\.google\.com/ {
    $homedir = '/usr/local/google/home/qdii'
    $at_work = true
    $limo = false
  }
  elsif $::fqdn == 'limo.dodges.it' {
    $homedir = '/home/qdii'
    $at_work = false
    $limo = true
  }
  else {
    $homedir = '/home/qdii'
    $at_work = false
    $limo = false
  }
  include qdii::arch
  include qdii::base
  include qdii::clipmenu
  include qdii::picom
  include qdii::docker_family
  #  include qdii::dunst
  include qdii::i3
  include qdii::irssi
  include qdii::mutt
  include qdii::optimus
  include qdii::user
  include qdii::tmux
  include qdii::vim
  #  include qdii::virtualbox
  #  include qdii::wireshark
  #  include qdii::xorg
  include qdii::shell

  User <| title == me |>
}
