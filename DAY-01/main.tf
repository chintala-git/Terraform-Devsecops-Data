terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "vpc-Terra" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "vpc-Terra"
  }
}

resource "aws_internet_gateway" "IGW-Terra" {
  vpc_id = aws_vpc.vpc-Terra.id

  tags = {
    Name = "IGW-Terra"
  }
}

resource "aws_subnet" "Pub-Sub-Terra" {
  vpc_id            = aws_vpc.vpc-Terra.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Pub-Sub-Terra"
  }
}

resource "aws_route_table" "RT-Terra" {
  vpc_id = aws_vpc.vpc-Terra.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW-Terra.id
  }
  tags = {
    Name = "RT-Terra"
  }
}


resource "aws_route_table_association" "RTA-Terra" {
  subnet_id      = aws_subnet.Pub-Sub-Terra.id
  route_table_id = aws_route_table.RT-Terra.id
}

resource "aws_security_group" "SG-Terra" {
  name        = "allow_Terra"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc-Terra.id

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


  tags = {
    Name = "SG-Terra"
  }
}

resource "aws_dynamodb_table" "state_locking" {
  hash_key = "LockID"
  name     = "dynamodb-state-locking"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}
