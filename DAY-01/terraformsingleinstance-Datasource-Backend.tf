data "aws_vpc" "terraform-aws-testing" {
  id = "vpc-0a6d7763a2f3fbb4b"
}

data "aws_subnet" "Terraform_Public_Subnet1-testing" {
  id = "subnet-00c83309ca2fcf541"
}

data "aws_security_group" "allow_all" {
  id = "sg-0ed6f37788971e43c"
}
