# Class: pdns_recursor::repo
#
# == Usage
#
# This class is not intended to be used directly.
#
class pdns_recursor::repo {

  case $::osfamily {
    'Redhat': {
      include yum

      case $yum::osver[0] {
        /(5|6)/: {
          yum::managed_yumrepo { 'pdns_recursor':
            descr       => 'pdns_recursor Repository $releasever - $basearch',
            baseurl     => "http://www.monshouwer.eu/download/3rd_party/pdns-recursor/el${yum::osver[0]}/\$basearch/",
            enabled     => 1,
            gpgcheck    => 0,
            gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-andy',
            priority    => 1,
          }
        }
        default: { 
          fail("$::osfamily $yum::osver[0] not supported")
        }
      }
    }

    default: {
      fail("$::osfamily not supported")
    }
  }
}
