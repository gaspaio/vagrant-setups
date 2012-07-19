class other {
  $packages = ["htop", "curl", "tmux", "vim"]

  package { $packages:
    ensure => present,
  }
}
