output "ip" {
  value = length(libvirt_domain.my_monitor.network_interface) > 0 && length(libvirt_domain.my_monitor.network_interface[0].addresses) > 0 ? libvirt_domain.my_monitor.network_interface[0].addresses[0] : null
}

output "url" {
  value = length(libvirt_domain.my_monitor.network_interface) > 0 && length(libvirt_domain.my_monitor.network_interface[0].addresses) > 0 ? "http://${libvirt_domain.my_monitor.network_interface[0].addresses[0]}" : null
}