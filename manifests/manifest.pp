node 'default' { 
  
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  include bootstrap
  
  class {'apache':
    httpd_user  => 'vagrant',
    httpd_group => 'vagrant',
  }

  #apache::vhost { 'vhost_name':
  #  port               => '80',
  #  docroot            => 'docroot',
  #  serveradmin        => 'rodolfo@me.org',
  #  configure_firewall => false,
  #}

  a2mod { 'rewrite': ensure => "present" }
  a2mod { 'expires': ensure => "present" }

  # MySQL
  class { 'mysql': }
  class { 'mysql::server':
    config_hash => {'root_password' => 'vagrant'}
  }
  

  # Ensure php cli & apache
  class {'php':}
  class {'php::apache2':
    memory_limit => '256M',
  }
  # Ensure MySQL bindings for PHP
  class {'mysql::php':}

  class {'php::pear':}
  class {'php::pecl':
    xdebug_remotehost => '192.168.33.1'
  }

  include other
 }

