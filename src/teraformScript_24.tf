# Create a new EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-a0cfeed8"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-example"
  }
}

# Create a security group
resource "aws_security_group" "example" {
  name        = "terraform-example"
  description = "Used in the terraform"

  ingress {
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
}

# Attach the security group to the instance
resource "aws_instance_security_group_association" "example" {
  instance_id = aws_instance.example.id
  security_group_id = aws_security_group.example.id
}