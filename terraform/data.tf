# VPC
data "aws_vpc" "palworld-vpc" {
  id = var.vpc_id
}

# public subnet
data "aws_subnet" "public-subnet" {
  id = var.subnet_id
}

# debian AMI
data "aws_ami" "debian-ami" {
  most_recent = true

  filter {
    name = "name"
    values = ["debian-11-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["136693071363"]
}
