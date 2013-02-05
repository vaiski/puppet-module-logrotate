Puppet logrotate module
=======================

A simple module for managing logrotate with Puppet.


Installation
------------

Clone this repo under your Puppet modules directory:

    cd /etc/puppet/modules
    git clone git://github.com/vaiski/puppet-module-logrotate.git logrotate


Usage
-------

Define a logrotation for a set of files:

    logrotate { 'logging_service': 
        logfile => '/var/log/logging_service/*.log',
        options => [ 
                'daily', 
                'missingok', 
                'compress',
                'notifempty',
                'rotate 7',
            ],
    }


License
-------

This module is released under MIT license (see LICENSE).
