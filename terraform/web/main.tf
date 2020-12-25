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
