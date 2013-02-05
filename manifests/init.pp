# logrotate/manifests/init.pp

class logrotate::service inherits logrotate::params {

    package { $logrotate::params::package_name:
        ensure => present,
    }

    file { $logrotate::params::config_dir:
        ensure  => directory,
        mode    => 755,
        owner   => root,
        group   => root,
        require => Package[$logrotate::params::package_name],
    }

    file { $logrotate::params::config_file:
        ensure  => present,
        mode    => 644,
        owner   => root,
        group   => root,
        content => template("logrotate/$logrotate::params::base_config_template"),
        require => Package[$logrotate::params::package_name],
    }
}

define logrotate (
    $logfile, 
    $options,
    $ensure = present,
) {
    include logrotate::service

    file { "${$logrotate::params::config_dir}/${name}":
        ensure  => $ensure,
        mode    => 644,
        owner   => root,
        group   => root,
        content => template("logrotate/$logrotate::params::config_template"),
        require => File[$logrotate::params::config_dir],
    }
}
