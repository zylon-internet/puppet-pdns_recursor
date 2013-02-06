# Class removal
#
class { 'pdns_recursor':
  absent => true,
}
