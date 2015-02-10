class php::pear {
    exec { 'update-pear':
        command => 'pear upgrade PEAR',
        user    => 'root',
        require => Class['php::baseline'],
    }
}