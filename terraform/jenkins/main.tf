provider "aws" {
  region = "us-east-1"
}

variable "name" {
  description = "Name the instance on deploy"
}

resource "aws_instance" "DevOps-Jenkins" {
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  key_name      = "devops"

  tags = {
    Name = "DevOps-Jenkins"
  }
}
resource "aws_security_group" "Jenkins-SG" {
  name   = "Jenkins-SG"
  
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
