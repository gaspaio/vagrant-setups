class php::pear {
  include php

  package { "php-pear":
    ensure => present,
    require => Package['php5'],
  }

  # upgrades PEAR, installs basic PHP tools
  exec { "pear_upgrade":
    command => "pear upgrade",
    require => Package['php-pear'],
  }

#  exec { "pear_auto_discover":
#    command => "pear config-set auto_discover 1",
#    require => [Package['php-pear'], Exec['pear_upgrade']],
#  }

#  exec { "pear_phpunit":
#    command => "pear install pear.phpunit.de/PHPUnit",
#    require => [Package['php-pear'], Exec['pear_auto_discover'], Exec['pear_upgrade']]
#  }

#  exec { "pear_phpunit/phploc":
#    command => "pear install phpunit/phploc",
#    require => [Package['php-pear'], Exec['pear_auto_discover'], Exec['pear_upgrade']]
#  }

#  exec { "pear_phpunit/phpcpd":
#    command => "pear install phpunit/phpcpd",
#    require => [Package['php-pear'], Exec['pear_auto_discover'], Exec['pear_upgrade']]
#  }

  #exec { "pear install PHP_Codesniffer":
  #  require => [Package['php-pear'], Exec['pear upgrade']]
  #}
  #exec { "pear channel-discover pear.phing.info":
  #  require => [Package['php-pear'], Exec['pear upgrade']]
  #}
  #exec { "pear install phing/phing":
  #  require => [Package['php-pear'], Exec['pear channel-discover pear.phing.info'], Exec['pear upgrade']]
  #}
  #exec { "pear channel-discover pear.phpmd.org":
  #  require => [Package['php-pear'], Exec['pear upgrade']]
  #}
  #exec { "pear channel-discover pear.pdepend.org":
  #  require => [Package['php-pear'], Exec['pear upgrade']]
  #}
  #exec { "pear install --alldeps phpmd/PHP_PMD":
  #  require => [Package['php-pear'], Exec['pear channel-discover pear.phpmd.org'], Exec['pear channel-discover pear.pdepend.org'], Exec['pear upgrade']]
  #}
  #exec { "pear install pdepend/PHP_Depend-beta":
  #  require => [Package['php-pear'], Exec['pear channel-discover pear.pdepend.org'], Exec['pear upgrade']]
  #}
}
