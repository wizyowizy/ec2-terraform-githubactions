output "private_key_pem_base64" {
  value     = base64encode(tls_private_key.ssh_key.private_key_pem)
  sensitive = true
}


output "instance_public_ip" {
  value = aws_instance.ec2.public_ip
}

#output "ubuntu_ami_id" {
#  value = data.aws_ami.ubuntu.id
#}