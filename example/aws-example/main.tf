resource "aws_instance" "my_instance" {
  #ami           = var.ami_image[var.aws_region]
  #ami                    = data.aws_ami.amazon_linux.id
  ami                    = data.aws_ami.ubuntu_focal.id

  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg_web.id]
  key_name               = aws_key_pair.my_sshkey.key_name

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./my_sshkey")
    host        = self.public_ip
    timeout     = "10m"
  }

  provisioner "remote-exec" {
    script = "wait_for_instance.sh"
  }

  provisioner "local-exec" {
    command = "ansible-playbook playbook-ubuntu.yaml"
  }

  tags = local.common_tags
}

resource "aws_eip" "my_eip" {
  vpc      = true
  instance = aws_instance.my_instance.id

  tags = local.common_tags
}

resource "aws_key_pair" "my_sshkey" {
  key_name   = "my_sshkey"
  public_key = file("./my_sshkey.pub")
}
