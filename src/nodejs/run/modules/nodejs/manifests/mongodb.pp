class nodejs::mongodb {
  file { '/etc/supervisor/conf.d/mongodb.conf':
    ensure => present,
    content => template('nodejs/mongodb.conf.erb'),
    mode => 644
  }
}
