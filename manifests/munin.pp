# Class: pdns_recursor::munin
#
# == Usage
#
# This class is not intended to be used directly.
#
class pdns_recursor::munin {

  include munin

  $plugins = [ 
    'answers',
    'cache',
    'cache_size',
    'concurrent',
    'issues',
    'outqueries',
    'querylatency',
    'questions',
    'throttle',
    'unauth'
    ]

  munplug {
    $plugins: ;
  }

  define munplug () {
    munin::plugin {
      $name:
        source => "pdns_recursor/munin-pdns_recursor/pdns_rec_$name";
    }
  }
}
