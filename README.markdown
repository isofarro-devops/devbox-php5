PHP5 Devbox
===========

A vagrant-based virtual machine for running multiple PHP projects side-by-side. So you don't have to create separate VMs for each project.

This gives the flexibility of jumping between projects (e.g. working on a webapp, a Wordpress theme, and a php library in the same virtual machine, but as separate repos/projects). Or running several independent PHP-based services talking to each other, without resorting to multiple virtual machines.


Platform:
---------

* Ubuntu 12.04 LTS (Precise Pangolin)
* Nginx 1.1.19 -- web server
* PHP 5.5.21 -- the ondrej repo package
    * PHP-FPM -- Fast-CGI Process Manager
    * PHPUnit 4.5.0 -- for PHP Unit testing
    * Composer 1.0 -- for PHP package management
* MySQL 5.5.41
* Memcache -- in-memory object cache system

Optional components:

* Beanstalk Message Queue
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


Enabling optional components:
-----------------------------

To enable the optional components, go into the `puppet/base.pp` file and uncomment the `include` line for the component.
