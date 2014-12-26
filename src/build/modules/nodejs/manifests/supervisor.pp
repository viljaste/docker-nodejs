class nodejs::supervisor {
  file { '/etc/supervisor/conf.d/nodejs.conf':
    ensure => present,
    source => 'puppet:///modules/nodejs/etc/supervisor/conf.d/nodejs.conf',
    mode => 644
  }
}
