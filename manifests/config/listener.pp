# Configures both the http and ssl (https) listeners on system
class winrm::config::listener {
  contain winrm::config::listener::http
  contain winrm::config::listener::https
}
