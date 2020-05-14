class qdii::optimus {
    if $qdii::limo {
        package { 'nvidia-prime':
            ensure => latest,
        }
    }
}
