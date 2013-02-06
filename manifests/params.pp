# Class: pdns_recursor::params
#
# This class defines default parameters used by the main module class pdns_recursor
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to pdns_recursor class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class pdns_recursor::params {

  $manage_repo = false
  $manage_munin = false
  $allow_from = [ '127.0.0.1/8' ]

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'pdns-recursor',
  }

  $service = $::operatingsystem ? {
    default => 'pdns-recursor',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'pdns-recursor',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'root',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/powerdns',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/powerdns/recursor.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/pdns_recursor',
    default                   => '/etc/sysconfig/pdns_recursor',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/pdns_recursor.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/pdns_recursor',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/pdns_recursor',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/pdns_recursor/pdns-recursor.log',
  }

  $port = '53'
  $protocol = 'udp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = 'pdns_recursor/recursor.conf.erb'
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
