class qdii::virtualbox {
  package { 'virtualbox':
    ensure => 'installed',
    name => 'virtualbox'
  }
  package { 'virtualbox-host-modules-arch':
    ensure => 'installed',
    name => 'virtualbox-host-modules-arch'
  }
  User <| title == me |> { groups +> 'vboxusers' }
}
