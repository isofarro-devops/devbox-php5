class php::composer {
    exec { 'download-composer':
        creates => '/tmp/composer.phar',
        command => 'curl -sS https://getcomposer.org/installer | php -- --install-dir=/tmp',
        user    => 'root',
        require => [
            Package['curl'],
            Package['php5-cli']
        ],
    }

    exec { 'install-composer':
        creates => '/usr/local/bin/composer',
        command => 'cp /tmp/composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer',
        user    => 'root',
        require => Exec['download-composer'],
    }
}