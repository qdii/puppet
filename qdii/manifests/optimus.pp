class qdii::optimus {
    if $qdii::limo {
        package { 'nvidia-prime':
            ensure => latest,
        }
        file { '10-gpu.conf':
            source => "puppet:///modules/qdii/dotfiles/10-gpu.conf",
            path   => "/etc/X11/xorg.conf.d/10-gpu.conf",
            owner  => "root",
            mode   => "0644",
        }
    }
}
