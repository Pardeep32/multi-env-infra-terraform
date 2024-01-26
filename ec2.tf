terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
resource "aws_instance" "demo_instance" {
  count = 2 
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.example_key_pair.key_name
  tags = {
    Name = var.instance_name
  }
}

resource "aws_default_vpc" "default_vpc" {

}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_sg"
  description = "Allow ssh inbound traffic"

  # using default VPC
  vpc_id      = aws_default_vpc.default_vpc.id
  ingress {
    description = "TLS from VPC"

    # we should allow incoming and outoging
    # TCP packets
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    # allow all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}



# Create key pair
resource "aws_key_pair" "example_key_pair" {
  key_name = var.key_pair_name
  public_key = file("~/.ssh/terraform.pub")
}
