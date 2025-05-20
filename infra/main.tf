provider "aws" {
  region = var.region
}

data "aws_vpc" "default" {
  default = true
}


resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-allow-web-and-ssh"
  description = "Allow SSH, HTTP, HTTPS, and app ports"
  vpc_id      = data.aws_vpc.default.id

  # Inbound Rules
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App Port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App Port 9090"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "DB Port 9090"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    description = "kube apiserver"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }
  ingress {
    description = "Kube Etcd"
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Kubelet "
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Kube Controller Manager "
    from_port   = 10257
    to_port     = 10257
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Kube Controller Scheduler "
    from_port   = 10259
    to_port     = 10259
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "NodePort Services"
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


# Outbound Rules - Allow all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "kubernetes-workers-nodes"
  }
}

resource "aws_instance" "master" {
  ami           = "ami-04f167a56786e4b09"
  instance_type = var.instance_type_master
  key_name      = aws_key_pair.generated_key.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Master-Node"
  }
}
resource "aws_instance" "worker-node-1" {
  ami           = "ami-04f167a56786e4b09"
  instance_type = var.instance_type
  key_name      = aws_key_pair.generated_key.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Worker-Node-1"
  }
}

resource "aws_instance" "worker-node-2" {
  ami           = "ami-04f167a56786e4b09"
  instance_type = var.instance_type
  key_name      = aws_key_pair.generated_key.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Worker-Node-2"
  }
}
