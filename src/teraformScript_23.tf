# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"
}

# Create an Elastic IP
resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

# Create a Security Group
resource "aws_security_group" "instance" {
  name        = "allow_ssh"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Associate the Security Group with the EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.instance.name}"]
}