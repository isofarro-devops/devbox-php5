#
# Beanstalk
#
class memcachedb {
    package { 'memcachedb':
        ensure  => installed,
        require => Package['core-packages'],
    }

    file { 'memcachedb-config':
        path    => '/etc/memcachedb.conf',
        ensure  => present,
        source  => 'puppet:///modules/memcachedb/memcachedb.conf',
        owner   => 'root',
        group   => 'root',
        mode    => '644',
        notify  => Service['memcachedb'],
        require => Package['memcachedb'],
    }

    service { 'memcachedb':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require => File['memcachedb-config']
    }
}