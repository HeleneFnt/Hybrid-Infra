# Variables for the project

variable "memory" {
  description = "Memory size for the VM"
  type        = number
  default     = 2048
  
}

variable "vcpu" {
  description = "Number of vCPUs for the VM"
  type        = number
  default     = 2
}

variable "source_image" {
  description = "Source image for the domain"
  type        = string
  default     = "/home/helene/Downloads/noble-server-cloudimg-amd64.img"
  
}

variable "name" {
  description = "Name of the domain"
  type        = string
  default     = "monitor"
  
}

variable "pool" {
  description = "Storage pool for the domain"
  type        = string
  default     = "default"
  
}

variable "format" {
  description = "Format of the domain"
  type        = string
  default     = "qcow2"
  
}

variable "network_name" {
  description = "Name of the network"
  type        = string
  default     = "default"
  
}

variable "ssh_key" {
  description = "Path to the SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
