class nodejs::packages {
  exec { 'apt-get update':
    path => ['/usr/bin']
  }

  exec { '/bin/bash -c "curl -sL https://deb.nodesource.com/setup | bash -"':
    require => Exec['apt-get update']
  }

  package {[
      'nodejs'
    ]:
    ensure => present,
    require => Exec['/bin/bash -c "curl -sL https://deb.nodesource.com/setup | bash -"']
  }
}
