class nodejs::packages {
  exec { '/bin/bash -c "curl -sL https://deb.nodesource.com/setup | bash -"': }

  package {[
      'nodejs'
    ]:
    ensure => present,
    require => Exec['/bin/bash -c "curl -sL https://deb.nodesource.com/setup | bash -"']
  }
}
