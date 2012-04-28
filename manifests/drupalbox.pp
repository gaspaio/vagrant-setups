# Default path
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

include bootstrap
include other
include apache
include mysql
#include memcached
include php
include php::pear
include php::pecl
include drupal
