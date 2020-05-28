class winrm::config::listener {
  contain winrm::config::listener::http
  contain winrm::config::listener::https
}
