# Class: pdns_recursor::spec
#
# This class is used only for rpsec-puppet tests
# Can be taken as an example on how to do custom classes but should not
# be modified.
#
# == Usage
#
# This class is not intended to be used directly.
# Use it as reference
#
class pdns_recursor::spec inherits pdns-recursor {

  # This just a test to override the arguments of an existing resource
  # Note that you can achieve this same result with just:
  # class { "pdns_recursor": template => "pdns-recursor/spec.erb" }

  File['pdns_recursor.conf'] {
    content => template('pdns_recursor/spec.erb'),
  }

}
