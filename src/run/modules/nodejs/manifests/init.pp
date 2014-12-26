class nodejs {
  if $mongodb_host {
    include nodejs::mongodb
  }
}
