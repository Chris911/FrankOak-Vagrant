class git {
    package { 'git-core':
        ensure => installed,
        require => Exec['apt-get update']
    }
}
