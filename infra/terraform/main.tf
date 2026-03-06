provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "k8s_node" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu AMI example
  instance_type = "t2.medium"
  count         = 2 # 2 Nodes for learning setup

  tags = {
    Name = "k8s-node-${count.index}"
  }

  # Security Group to allow traffic
  security_groups = [aws_security_group.k8s_sg.name]
}

resource "aws_security_group" "k8s_sg" {
  name        = "k8s_security_group"
  description = "Allow web traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ips" {
  value = aws_instance.k8s_node.*.public_ip
}