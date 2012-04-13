class apache {
  package { "apache2":
    ensure => present,
  }

  # starts the apache2 service once the packages installed, and monitors changes
  # to its configuration files and reloads if necessary
  service { "apache2":
    ensure => running,
    enable => true,
    require => Package['apache2'],
    subscribe => [
      File["rewrite"],
      File["vhost_default"],
    ],
  }

  # ensures that mod_rewrite is loaded and modifies the default configuration file
  file { "rewrite":
    path => "/etc/apache2/mods-enabled/rewrite.load",
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package['apache2'],
  }

  # Example vhost file
  file { "vhost_example":
    path => "/etc/apache2/sites-available/vhost.example",
    ensure => present,
    source => "puppet:///modules/apache/vhost_example",
    owner => 'root',
    group => 'root',
    require => Package['apache2'],
  }

  # Default vhost conf
  file { "vhost_default":
    path => "/etc/apache2/sites-available/default",
    ensure => present,
    source => "puppet:///modules/apache/vhost_default",
    owner => 'root',
    group => 'root',
    require => Package['apache2'],
  }

  # Main apache conf
  file { "conf":
    path => "/etc/apache2/apache2.conf",
    ensure => present,
    source => "puppet:///modules/apache/apache2.conf",
    owner => 'root',
    group => 'root',
    require => Package['apache2'],
  }

  exec { 'echo "ServerName localhost" | sudo tee /etc/apache2/conf.d/fqdn':
    require => Package['apache2'],
  }
}
