class drupal {
  include php
  include php::pear

  exec { "drush_pear_discover":
    command => "pear channel-discover pear.drush.org",
    require => Package['php-pear'],
  }

  exec { "drush_pear":
    command => "pear install drush/drush",
    require => [Package['php-pear'], Exec['drush_pear_discover']],
  }

  #Run drush once as root to initialise its caches
  exec { "drush":
    command => "drush > /dev/null",
    require => Exec['drush_pear'],
  }

#  file { "drushrc":
#    path => "/etc/drush/drushrc.php",
#    ensure => present,
#    source => "puppet:///modules/drupal/drushrc.php",
#    recurse => true,
#    require => Exec['drush_pear'],
#  }
}
