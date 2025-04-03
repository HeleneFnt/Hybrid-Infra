output "ip" {
  value = length(libvirt_domain.my_ubuntu.network_interface) > 0 && length(libvirt_domain.my_ubuntu.network_interface[0].addresses) > 0 ? libvirt_domain.my_ubuntu.network_interface[0].addresses[0] : null
}

output "url" {
  value = length(libvirt_domain.my_ubuntu.network_interface) > 0 && length(libvirt_domain.my_ubuntu.network_interface[0].addresses) > 0 ? "http://${libvirt_domain.my_ubuntu.network_interface[0].addresses[0]}" : null
}