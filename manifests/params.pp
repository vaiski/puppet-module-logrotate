# logrotate/manifests/params.pp

class logrotate::params {
    case $::lsbdistid {
        'Ubuntu', 'Debian': {
            $package_name = 'logrotate'
            $config_file = '/etc/logrotate.conf'
            $config_dir = '/etc/logrotate.d'
            $config_template = 'logrotate.debian.erb'
            $base_config_template = 'baseconf.debian.erb'
        }

        default: {
            fail("Unsupported operating system.")
        }
    }
}
