#
# PHP5 environment
#
class php {
	package { 'php5-baseline':
		name => [
			'php5-cli',
			'php5-fpm',
			'php-pear',
			'php5-sqlite',
			'php5-mysql',
		],
		ensure  => installed,
		require => Package['core-packages'],
	}

	file { 'php5-fpm-ini':
		path    => '/etc/php5/fpm/php.ini',
		ensure  => present,
		source  => 'puppet:///modules/php/fpm-php.ini',
		owner   => 'root',
		group   => 'root',
		mode    => '644',
		require => Package['php5-baseline'],
		notify  => Service['php5-fpm'],
	}

	file { 'php5-fpm-www-conf':
		path    => '/etc/php5/fpm/pool.d/www.conf',
		ensure  => present,
		source  => 'puppet:///modules/php/fpm-pool-www.conf',
		owner   => 'root',
		group   => 'root',
		mode    => '644',
		require => Package['php5-baseline'],
		notify  => Service['php5-fpm'],
	}

	service { 'php5-fpm':
		ensure     => running,
		enable     => true,
		hasrestart => true,
		hasstatus  => true,
		require    => [
			Package['php5-baseline'],
			File['php5-fpm-ini'],
			File['php5-fpm-www-conf'],
		],
	}

	exec { 'update-pear':
		command => 'pear upgrade PEAR',
		user    => 'root',
		require => Package['php5-baseline'],
	}

	include php::phpunit
	include php::composer
}