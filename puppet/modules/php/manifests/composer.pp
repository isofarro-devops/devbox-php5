class php::composer {
    exec { 'download-composer':
        creates => '/tmp/composer.phar',
        command => 'wget -O /tmp/composer.phar https://getcomposer.org/download/1.1.1/composer.phar',
        user    => 'root',
        require => Package['wget'],
    }

    exec { 'install-composer':
        creates => '/usr/local/bin/composer',
        command => 'cp /tmp/composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer',
        user    => 'root',
        require => Exec['download-composer'],
    }
}