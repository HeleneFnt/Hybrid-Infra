# Hybrid-Infra

## Overview
Hybrid-Infra is an infrastructure automation project using OpenTofu (Terraform), KVM, and Ansible to deploy and manage Linux servers (Ubuntu, Rocky Linux). The project also includes monitoring via Zabbix and an optional cloud deployment.


## Table of Contents
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Deployment Steps](#deployment-steps)
  - [1. Deploy OpenTofu](#1-deploy-opentofu)
  - [2. Deploy an Ubuntu Server with OpenTofu](#2-deploy-an-ubuntu-server-with-opentofu)
  - [3. Configure a CMS with Ansible](#3-configure-a-cms-with-ansible)
  - [4. Deploy a Rocky Linux Server](#4-deploy-a-rocky-linux-server)
  - [5. Configure a CMS on Rocky Linux](#5-configure-a-cms-on-rocky-linux)
  - [6. Deploy a Monitoring System](#6-deploy-a-monitoring-system)
  - [7. (Bonus) Cloud Deployment](#7-bonus-cloud-deployment)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites
- Linux host machine (Ubuntu/Rocky Linux recommended)
- KVM installed and configured
- OpenTofu (Terraform fork) installed
- Ansible installed
- Docker installed (for monitoring system)

## Project Structure
```
Hybrid-Infra/
├── terraform/
│   ├── ubuntu-server/    # Terraform module for Ubuntu VM
│   ├── rocky-server/     # Terraform module for Rocky Linux VM
│   └── cloud/            # (Optional) Cloud deployment module
├── ansible/
│   ├── roles/
│   │   ├── common/       # Common configuration
│   │   ├── cms/          # CMS deployment
│   │   └── monitoring/   # Zabbix configuration
│   └── playbooks/
│       ├── ubuntu.yml
│       ├── rocky.yml
│       ├── monitoring.yml
│       └── cloud.yml
└── README.md
```

## Installation
```sh
# Install OpenTofu
curl -fsSL https://opentofu.org/install.sh | bash

# Install Ansible
sudo apt update && sudo apt install -y ansible

# Install KVM dependencies
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
```

## Deployment Steps
### 1. Deploy OpenTofu
Ensure OpenTofu is installed:
```sh
tofu --version
```

### 2. Deploy an Ubuntu Server with OpenTofu
```sh
cd terraform/ubuntu-server
tofu init
tofu apply -auto-approve
```

### 3. Configure a CMS with Ansible
```sh
cd ansible
ansible-playbook playbooks/ubuntu.yml
```

### 4. Deploy a Rocky Linux Server
```sh
cd terraform/rocky-server
tofu init
tofu apply -auto-approve
```

### 5. Configure a CMS on Rocky Linux
```sh
cd ansible
ansible-playbook playbooks/rocky.yml
```

### 6. Deploy a Monitoring System (Zabbix in Docker)
```sh
cd ansible
ansible-playbook playbooks/monitoring.yml
```

### 7. (Bonus) Cloud Deployment
```sh
cd terraform/cloud
tofu init
tofu apply -auto-approve
```

## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a feature branch.
3. Commit changes and push to your branch.
4. Open a pull request.

## License
This project is licensed under the MIT License.