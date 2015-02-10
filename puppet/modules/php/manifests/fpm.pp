class php::fpm {
    file { 'php5-fpm-ini':
        path    => '/etc/php5/fpm/php.ini',
        ensure  => present,
        source  => 'puppet:///modules/php/fpm-php.ini',
        owner   => 'root',
        group   => 'root',
        mode    => '644',
        require => Class['php::baseline'],
        notify  => Service['php5-fpm'],
    }

    file { 'php5-fpm-www-conf':
        path    => '/etc/php5/fpm/pool.d/www.conf',
        ensure  => present,
        source  => 'puppet:///modules/php/fpm-pool-www.conf',
        owner   => 'root',
        group   => 'root',
        mode    => '644',
        require => Class['php::baseline'],
        notify  => Service['php5-fpm'],
    }

    service { 'php5-fpm':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
    }
}