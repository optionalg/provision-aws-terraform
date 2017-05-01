# ========================ECS Instances=======================

provider "aws" {}

# EC2 instances
resource "aws_instance" "sampleInstances" {
  count = 1

  # ami = "${var.ecsAmi}"
  ami = "ami-80861296"
  availability_zone = "us-east-1a"
  instance_type = "t2.micro"
  subnet_id = "subnet-c0732fa5"
  associate_public_ip_address = true
  source_dest_check = false

  tags = {
    Name = "sampleInstances-${count.index}"
  }
}
