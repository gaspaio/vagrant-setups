class php::pecl {
  include php

  # Install xdebug via PECL
  exec { 'pecl_xdebug':
    command => "pecl install xdebug",
    unless => 'pecl list | grep "xdebug"',
    require => [Package['php-pear', 'php5-dev'], Exec['pear_upgrade']],
  }

  # Install more recent APC version from PECL
  exec { "pecl_apc":
    command => 'pecl install apc',
    unless => 'pecl list | grep "apc"',
    require => [Package['php-pear', 'php5-dev', 'libpcre3-dev'], Exec['pear_upgrade']],
  }

  file { "apc_ini":
    path => "/etc/php5/conf.d/apc.ini",
    ensure => present,
    owner => 'root',
    group => 'root',
    source => "puppet:///modules/php/apc.ini",
    require => Exec['pecl_apc'],
  }

  file { "xdebug_ini":
    path => "/etc/php5/conf.d/xdebug.ini",
    ensure => present,
    source => "puppet:///modules/php/xdebug.ini",
    owner => 'root',
    group => 'root',
    require => Exec['pecl_xdebug'],
  }
}
