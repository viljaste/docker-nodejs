node default {
  file { '/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  exec { 'apt-get update':
    path => ['/usr/bin'],
  }

  package { 'curl':
    ensure => present,
    require => Exec['apt-get update']
  }

  exec { 'bash -c "curl -sL https://deb.nodesource.com/setup | bash -"':
    path => ['/bin', '/usr/bin'],
    require => Package['curl']
  }

  package { 'nodejs':
    ensure => present,
    require => Exec['bash -c "curl -sL https://deb.nodesource.com/setup | bash -"']
  }
}