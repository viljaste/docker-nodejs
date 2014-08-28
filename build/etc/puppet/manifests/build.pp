node default {
  file { '/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  exec { 'apt-get update':
    cwd => ['/usr/bin'],
  }

  package { 'curl':
    ensure => present,
    require => Exec['/usr/bin/apt-get update']
  }

  exec { 'bash -c "curl -sL https://deb.nodesource.com/setup | bash -"':
    cwd => ['/bin'],
    require => Package['curl']
  }

  package { 'nodejs':
    ensure => present,
    require => Exec['/bin/bash -c "curl -sL https://deb.nodesource.com/setup | bash -"']
  }
}