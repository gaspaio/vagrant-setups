node 'default' {
  
  include bootstrap
  
  class {'apache':
    httpd_user  => 'vagrant',
    httpd_group => 'vagrant',
  }

  apache::vhost { 'mysite.test.vt':
    port               => '80',
    docroot            => '/var/projects/mysite.test.vt',
    serveradmin        => 'rodolfo@me.org',
    configure_firewall => false,
  }

  # The apache module provides us with a new type: a2mod
  #a2mod { 'rewrite':
  #  ensure => "present"
  #}

  # Ensure CLI with the default params
  class {'php':}

}

