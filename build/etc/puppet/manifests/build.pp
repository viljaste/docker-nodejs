node default {
  file { '/opt/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  file { '/etc/puppet/manifests/run.pp':
    ensure => present,
    source => '/tmp/build/etc/puppet/manifests/run.pp'
  }

  package { 'curl':
    ensure  => present
  }

  exec { 'curl -sL https://deb.nodesource.com/setup | bash -':
    command => 'curl -sL https://deb.nodesource.com/setup | bash -',
    require => Package['curl']
  }

  package { 'nodejs':
    ensure  => 'installed',
    require => Exec['curl -sL https://deb.nodesource.com/setup | bash -']
  }
}