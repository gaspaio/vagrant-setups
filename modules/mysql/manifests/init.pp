class mysql {
  $mysqlPassword = "vagrant"
  $packages = ['mysql-server', 'mytop']

  package { $packages:
    ensure => present,
  }

  service { "mysql":
    enable => true,
    ensure => running,
    require => Package["mysql-server"],
  }

  file { "my_cnf":
    path => "/etc/mysql/my.cnf",
    ensure => present,
    source => "puppet:///modules/mysql/my.cnf",
    owner => 'root',
    group => 'root',
    require => Package['mysql-server'],
    notify => Service["mysql"],
  }

  file { "mytop":
    path => "/home/vagrant/.mytop",
    ensure => present,
    source => "puppet:///modules/mysql/mytop",
    owner => 'vagrant',
    group => 'vagrant',
    require => Package['mytop', 'mysql-server'],
  }

  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysqlPassword status",
    command => "mysqladmin -uroot password $mysqlPassword",
    require => Service["mysql"],
  }
}

