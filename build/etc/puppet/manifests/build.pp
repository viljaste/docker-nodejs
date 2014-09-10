class packages {
  package {[
      'curl',
      'nodejs'
    ]:
    ensure => present,
  }
}

node default {
  file { '/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  include packages

  exec { 'apt-get update':
    path => ['/usr/bin'],
    before => Class['packages']
  }

  exec { '/bin/bash -c "curl -sL https://deb.nodesource.com/setup | bash -"':
    before => Exec['apt-get update']
  }
}