packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "wordpress" {
  region        = "ap-northeast-2"
  profile       = "default"

  ami_name      = "wordpress"
  instance_type = "t2.small"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = var.ssh_account
  #force_deregister = true
}

build {
  name = "wordpress-build"
  sources = [
    "source.amazon-ebs.wordpress"
  ]

  provisioner "ansible" {
    playbook_file = "../ansible-wordpress-deploy/site.yaml"
    extra_arguments = [
      "--become",
    ]
    ansible_env_vars = [
      "ANSIBLE_HOST_KEY_CHECKING=False",
    ]
  }
}
