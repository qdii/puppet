class qdii::wireshark {
  package { 'wireshark-cli':
    ensure => 'installed',
    name => 'wireshark-cli'
  }
  package { 'wireshark-gtk':
    ensure => 'installed',
    name => 'wireshark-gtk'
  }
  package { 'wireshark-common':
    ensure => 'installed',
    name => 'wireshark-common'
  }
  User <| title == me |> { groups +> "wireshark" }
}
