provider "aws" {
  region = "us-east-1"
}

variable "name" {
  description = "Name of the web box at apply"
}

resource "aws_instance" "DevOps-Web" {
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  key_name      = "devops"

  tags = {
    Name = "DevOps-Web"
  }
}
resource "aws_security_group" "Web-SG" {
  name   = "Web-SG"

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
