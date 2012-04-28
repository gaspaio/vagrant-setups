class memcached {
  $packages = ["memcached", "libmemcached-tools"]

  package { $packages:
    ensure => present,
  }

# TODO download phpmemcachedadmin into /var/www/info
}
