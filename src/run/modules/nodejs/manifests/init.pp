class nodejs {
  file { '/etc/supervisor/conf.d/app.conf':
    ensure => present,
    content => template('nodejs/app.conf.erb'),
    mode => 644
  }

  if $mongodb_host {
    include nodejs::mongodb
  }
}
