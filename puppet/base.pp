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

# PHP install: CLI and FPM
include php

# Memcache
include memcache

# Beanstalk message queue (optional)
#include beanstalk

# MemcacheDb - document store
include memcachedb


#
# Project specific config
#

