#
# Beanstalk
#
class memcache {
    package { 'memcached':
        ensure  => installed,
        require => Package['core-packages'],
    }

    service { 'memcached':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require => Package['memcached']
    }
}