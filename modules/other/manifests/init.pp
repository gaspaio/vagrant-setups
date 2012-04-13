class other {
  $packages = ["htop", "curl", "tmux", "vim", "mercurial"]

  file { "hgrc":
    path => "/home/vagrant/.hgrc",
    ensure => present,
    source => "puppet:///modules/other/hgrc",
    require => Package['mercurial'],
  }

  package { $packages:
    ensure => present,
  }
}
