node default {
  file { '/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  exec { '/usr/bin/apt-get update':
  }

  package { 'curl':
    ensure => present,
    require => Exec['/usr/bin/apt-get update']
  }

  exec { '/usr/bin/curl -sL https://deb.nodesource.com/setup | bash -':
    require => Package['curl']
  }

  package { 'nodejs':
    ensure => present,
    require => Exec['/usr/bin/curl -sL https://deb.nodesource.com/setup | bash -']
  }
}