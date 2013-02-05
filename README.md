Puppet logrotate module
=======================

A simple module for managing logrotate with Puppet.


Installation
------------

Clone this repo under your Puppet modules directory:

    cd /etc/puppet/modules
    git clone git://github.com/vaiski/puppet-module-logrotate.git monit


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

Copyright (c) 2013 by Eemil Väisänen <eemil.vaisanen@iki.fi>.

This module is released under MIT license (see LICENSE).
