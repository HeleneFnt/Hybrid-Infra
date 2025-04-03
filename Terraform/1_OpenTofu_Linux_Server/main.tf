# Define the libvirt provider
resource "libvirt_domain" "my_ubuntu" {
  name   = var.name
  memory = var.memory
  vcpu   = var.vcpu


    provisioner "local-exec" {
    command = "sudo chmod 660 ${var.source_image}"
  }

  disk {
  volume_id = libvirt_volume.ubuntu_qcow2.id
  }

  network_interface {
    network_name = "default"
    wait_for_lease = true
  }

  cloudinit = libvirt_cloudinit_disk.commoninit.id

    console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }

}

# Define the libvirt volume
resource "libvirt_volume" "ubuntu_qcow2" {
  name    = var.name
  pool    = var.pool
  format  = var.format
  source  = var.source_image
}