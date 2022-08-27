data "aws_ami" "wordpress" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["wordpress"]
  }
}
