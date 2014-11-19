class nodejs {
  require nodejs::packages

  package { 'nodejs':
    ensure => present
  }

  exec { '/bin/bash -c "curl -sL https://deb.nodesource.com/setup | bash -"':
    before => Package['nodejs']
  }
}
