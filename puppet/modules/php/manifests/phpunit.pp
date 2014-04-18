class php::phpunit {

    exec { 'download-phpunit':
        creates => '/tmp/phpunit.phar',
        command => 'wget -O /tmp/phpunit.phar https://phar.phpunit.de/phpunit.phar',
        require => Package['php5-baseline'],

    }

    exec { 'install-phpunit':
        creates => '/usr/local/bin/phpunit',
        command => 'cp /tmp/phpunit.phar /usr/local/bin/phpunit && chmod +x /usr/local/bin/phpunit',
        user    => 'root',
        require => Exec['download-phpunit'],
    }

}