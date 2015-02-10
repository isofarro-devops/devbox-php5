#
# Base install
#
class baseconfig {
    exec { 'apt-update':
        command => 'apt-get update',
        user    => 'root',
    }

    package { [
            'python-software-properties',
            'wget',
            'curl',
            'vim',
            'git-core',
            'htop',
            'sqlite3',
        ]:
        ensure  => present,
        require => Exec['apt-update'],
    }
}