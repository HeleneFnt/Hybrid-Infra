
resource "libvirt_cloudinit_disk" "commoninit" {
  name = "${var.name}-commoninit.iso"
  pool = "default"
  user_data      = data.template_cloudinit_config.config.rendered
  network_config = data.template_file.network_config.rendered
}

data "template_file" "user_data" {
  template = templatefile("${path.module}/config/cloud_init.yaml", {
    hostname = var.name
    ssh_key  = file(var.ssh_key)
  })
}

data "template_cloudinit_config" "config" {
  gzip = false
  base64_encode = false
  part {
    filename = "init.cfg"
    content_type = "text/cloud-config"
    content = "${data.template_file.user_data.rendered}"
  }
}

data "template_file" "network_config" {
  template = templatefile("${path.module}/config/network_config.yaml", {})
}