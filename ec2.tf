provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAUS4Z6J4M6RPITE4J"
  secret_key = "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"
}


resource "aws_instance" "first-tf-instance" {
  ami           = "ami-0f924dc71d44d23e2"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key-tf.key_name
 vpc_security_group_ids = ["${aws_security_group.tf-sg.id}"]   
tags = {
    Name = "first-tf-instance"
  }
}

resource "aws_security_group" "tf-sg" {
  name        = "tf-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0f57e31a99d2baf57"

  ingress {
    description = "Allow TLS inbound traffic"
    from_port   = 0 
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform_instance-1"
  }
}
