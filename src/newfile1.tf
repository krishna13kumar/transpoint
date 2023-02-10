# Create a provider
provider "aws" {
  region = "us-east-1"
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"
}

# Create an EBS volume
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 1
}

# Attach the EBS volume to the EC2 instance
resource "aws_volume_attachment" "example" {
  device_name  = "/dev/sda1"
  volume_id    = "${aws_ebs_volume.example.id}"
  instance_id  = "${aws_instance.example.id}"
}