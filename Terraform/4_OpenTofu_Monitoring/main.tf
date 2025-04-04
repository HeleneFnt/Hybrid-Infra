# Define the libvirt provider
resource "libvirt_domain" "my_monitor" {
  name   = var.name
  memory = var.memory
  vcpu   = var.vcpu


    provisioner "local-exec" {
    command = "sudo chmod 660 ${var.source_image}"
  }

  disk {
  volume_id = libvirt_volume.monitor_qcow2.id
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
resource "libvirt_volume" "monitor_qcow2" {
  name    = var.name
  pool    = var.pool
  format  = var.format
  source  = var.source_image
}

resource "null_resource" "setup_monitoring" {
  depends_on = [libvirt_domain.my_monitor]

  provisioner "remote-exec" {
    inline = ["sudo apt update && sudo apt install -y ansible"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = "192.168.122.138"
      private_key = file("~/.ssh/id_rsa")
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${libvirt_domain.my_monitor.network_interface[0].addresses[0]},' --private-key ~/.ssh/id_rsa install_monitoring.yaml"
  }
}
