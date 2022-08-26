output "public_ip" {
  value = aws_instance.my_instance.public_ip
}

#output "elastic_ip" {
#  value = aws_eip.my_eip.public_ip
#}

