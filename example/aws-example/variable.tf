variable "aws_region" {
  default = "ap-northeast-2"
}

variable "ami_image" {
  type = map(any)

  default = {
    ap-northeast-1 = "ami-00cd31d940a501cdf" # Tokyo
    ap-northeast-2 = "ami-0ea5eb4b05645aa8a" # Seoul
  }
}

variable "instance_type" {
  default = "t3.micro"
}

variable "project_name" {
  default = "my_project"
}

variable "environment" {
  default = "staging"
}
