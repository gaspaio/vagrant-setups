

node 'default' {
  $apache_user = 'vagrant'
  $apache_group = 'vagrant'
  include bootstrap
  include apache

  apache::vhost { 'mysite.test.vt':
    port               => '80',
    docroot            => '/var/projects/mysite.test.vt',
    serveradmin        => 'rodolfo@me.org',
    configure_firewall => false,
  }
}

