output "private_key_pem_base64" {
  value     = base64encode(tls_private_key.ssh_key.private_key_pem)
  sensitive = true
}


output "instance_public_ip" {
  value = aws_instance.ec2.nginx
}

output "instance_public_ip" {
  value = aws_instance.ec2.apache
}

output "instance_public_ip" {
  value = aws_instance.ec2.mysql
}

#output "ubuntu_ami_id" {
#  value = data.aws_ami.ubuntu.id
#}