output "private_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "instance_public_ip_master" {
  value = aws_instance.master.public_ip
}

output "instance_public_ip_worker-1" {
  value = aws_instance.worker-node-1.public_ip
}

output "instance_public_ip_worker-2" {
  value = aws_instance.worker-node-2.public_ip
}
output "public_key_openssh" {
  value = tls_private_key.ssh_key.public_key_openssh
}

