PHP5 Devbox
===========

A vagrant-based virtual machine for running multiple PHP projects, so you don't have to create separate VagrantFiles for each project, and you want the flexibility of jumping between these projects (e.g. working on a webapp, a Wordpress theme, and a php library in the same virtual machine, but as separate repos/projects).


Platform:
---------

* PHP5.3 -- the standard Ubuntu package
* PHPUnit -- for PHP Unit testing
* Composer -- for PHP package management
* PHP-FPM
* nginx
* MySQL
* beanstalkd


Getting started
---------------

This configuration assumes that all your PHP projects are together in one directory (e.g. in `~/Projects/`). So we clone this repo inside your Projects directory.

	cd ~/Projects
	git clone git@github.com/isofarro/devbox-php5.git
	cd devbox-php5.git
	vagrant up

When the provisioning is finished, you can now ssh into your new devbox:

	vagrant ssh
	ls -la Projects/

This lists all the projects you have in the `~/Projects` folder of your host.

In `/etc/hosts` of your host, add an entry for this:

	192.168.128.128		devbox-php.dev

And hitting `http://devbox-php.dev/` in a browser brings up the nginx welcome page.

