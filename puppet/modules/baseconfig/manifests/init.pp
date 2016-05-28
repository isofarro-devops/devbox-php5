#
# Base install
#
class baseconfig {
    exec { 'apt-update':
        command => 'apt-get update',
        user    => 'root',
    }

    exec { "apt-upgrade":
        command => "/usr/bin/apt-get --yes --fix-broken upgrade",
        logoutput => "on_failure",
        timeout => 0,
        path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin:/sbin",
        require => Exec['apt-update'],
    }

    package { [
            'python-software-properties',
            'wget',
            'curl',
            'vim',
            'git-core',
            'htop',
            'sqlite3',
            'unzip',
        ]:
        ensure  => present,
        require => Exec['apt-update'],
    }
}