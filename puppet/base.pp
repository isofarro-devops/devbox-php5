#
# Global defaults/config
#
Exec {
    path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
}

# Project variables
$projectName   = "devbox-php5"
$projectDir    = "/home/vagrant/Projects/${projectName}"
$projectDomain = "devbox-php.dev"


#
# Modules: what does your project need?
#

# Base Ubuntu packages and configuration
include baseconfig

# Mysql client and server
include mysql

# Nginx web server
include nginx

# OPTIONAL: PHP 5.5 from ondrej
# include php55

# PHP install: CLI and FPM
include php

# Memcache
include memcache

# OPTIONAL: Beanstalk message queue
# include beanstalk

# OPTIONAL: MemcacheDb - document store
# include memcachedb


#
# Project specific config
#

