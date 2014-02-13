class redis {
    package { 'git-core':
        ensure => installed,
        require => Exec['apt-get update']
    }
}
