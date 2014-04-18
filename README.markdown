PHP5 Devbox
===========

A vagrant-based virtual machine for running multiple PHP projects side-by-side. So you don't have to create separate VMs for each project.

This gives the flexibility of jumping between projects (e.g. working on a webapp, a Wordpress theme, and a php library in the same virtual machine, but as separate repos/projects). Or running several independent PHP-based services talking to each other, without resorting to multiple virtual machines.


Platform:
---------

* Ubuntu 12.04 LTS (Precise Pangolin)
* Nginx -- web server
* PHP 5.3.28 -- the standard Ubuntu package
    * PHP-FPM -- Fast-CGI Process Manager
    * PHPUnit -- for PHP Unit testing
    * Composer -- for PHP package management
* MySQL
* Beanstalk Message Queue
* Memcache -- in-memory object cache system
* MemcacheDB -- Berkeley DBM backed persistent document store using Memcache protocol


Getting started
---------------

This configuration assumes that all your PHP projects are together in one directory (e.g. in `~/Projects/`). So we clone this repo inside your Projects directory.

	cd ~/Projects
	git clone git@github.com:isofarro/devbox-php5.git
	cd devbox-php5
	vagrant up

When the provisioning is finished (takes about 5 minutes), you can now ssh into your new devbox:

	vagrant ssh
	ls -la Projects/

This lists all the projects you have in the `~/Projects` folder of your host.

In `/etc/hosts` of your host, add an entry for this:

	192.168.128.128		devbox-php.dev

And hitting `http://devbox-php.dev/` in a browser brings up the nginx welcome page.

