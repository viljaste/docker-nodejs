class packages {
  package {[
      'curl',
      'sudo'
    ]:
    ensure => present
  }
}

class nodejs {
  package { 'nodejs':
    ensure => present
  }

  exec { '/bin/bash -c "curl -sL https://deb.nodesource.com/setup | sudo bash -"':
    require => Package['nodejs']
  }
}

node default {
  file { '/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  include packages
  include nodejs

  Class['packages'] -> Class['nodejs']

  exec { 'apt-get update':
    path => ['/usr/bin'],
    before => Class['packages']
  }
}