#
# Mysql
#
class mysql {
    package { 'mysql-server':
        ensure => installed,
        require => Class['baseconfig'],
    }

    #file { '/var/lib/mysql/my.cnf':
    #    owner   => 'mysql',
    #    group   => 'mysql',
    #    source  => 'puppet:///modules/mysql/my.cnf',
    #    notify  => Service['mysql'],
    #    require => Package['mysql-server']
    #}


    #file { '/etc/my.cnf':
    #    require => File['/var/lib/mysql/my.cnf'],
    #    ensure  => '/var/lib/mysql/my.cnf'
    #}


    exec { 'set-mysql-password':
        unless => 'mysqladmin -uroot -prootpwd status',
        command => 'mysqladmin -uroot password rootpwd',
        path   => ['/bin', '/usr/bin'],
        require => Package['mysql-server'],
    }

    exec { 'create-webdev-user':
        command => "mysql -uroot -prootpwd -e \"GRANT ALL PRIVILEGES ON *.* TO webdev@localhost IDENTIFIED BY 'webdev';\"",
        path    => ['/usr/bin'],
        require => Exec['set-mysql-password'],
    }

    service { 'mysql':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Package['mysql-server'],

    }
}