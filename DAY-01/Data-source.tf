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

data "aws_vpc" "Data-Source" {
  id = "vpc-0ae4a441b1e606319"
}

resource "aws_internet_gateway" "Data-Source-IGW" {
  vpc_id = data.aws_vpc.Data-Source.id

  tags = {
    Name = "Data-Source-IGW"
  }
}
