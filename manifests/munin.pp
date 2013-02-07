# Class: pdns_recursor::munin
#
# == Usage
#
# This class is not intended to be used directly.
#
class pdns_recursor::munin {

  include munin

  munin::plugin {
    'pdns_rec_':
      content_config => "[pdns_rec_*]\nuser root"
  }

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
    $completename = "pdns_rec_$name"
    munin::plugin {
      $completename:
        source => "pdns_recursor/munin-pdns_recursor/$completename";
    }
  }


}
