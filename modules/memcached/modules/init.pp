class memcached {
#  $packages = ["memcached", "php5-memcached"]

  package { 'memcached':
    ensure => present,
  }
}
