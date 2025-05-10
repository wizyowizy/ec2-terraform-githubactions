output "private_key_pem" {
  value     = base64encode(tls_private_key.ssh_key.private_key_pem)
  sensitive = true
}

output "instance_public_ip_nginx" {
  value = aws_instance.nginx.public_ip
}

output "instance_public_ip_apache" {
  value = aws_instance.apache.public_ip
}

output "instance_public_ip_mysql" {
  value = aws_instance.mysql.public_ip
}


