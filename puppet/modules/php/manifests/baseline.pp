class php::baseline {
    package { [
            'php5-cli',
            'php5-fpm',
            'php-pear',
            'php5-sqlite',
            'php5-mysql',
            'php5-memcache',
            'php5-curl'
        ]:
        ensure  => installed,
        require => Class['baseconfig'],
    }
}