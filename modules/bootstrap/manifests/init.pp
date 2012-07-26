# Class: bootstrap
#
# This class is run at first to initialize the configuration of the server and
# before provisionning starts.
#
# Parameters:
#
# Requires:
#
# Sample Usage:
#
class bootstrap {
  # this makes puppet and vagrant shut up about the puppet group
  group { "puppet":
    ensure => "present",
  }

  # Set FQDN for virtualbox
  #TODO We can't assign this variable (in another namepace)
  #if $::virtual == "virtualbox" and $::fqdn == '' {
  #  $::fqdn = "localhost"
  #}


  # Ensure apt-get update runs before any other package installation
  # cf. http://johnleach.co.uk/words/771/puppet-dependencies-and-run-stages
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec["apt-update"] -> Package <| |>
}
