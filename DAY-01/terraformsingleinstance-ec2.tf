resource "aws_instance" "web-1" {
  ami                         = "ami-053b12d3152c0cc71"
  availability_zone           = "ap-south-1a"
  instance_type               = "t2.micro"
  key_name                    = "dev_key"
  subnet_id                   = data.aws_subnet.Terraform_Public_Subnet1-testing.id
  vpc_security_group_ids      = ["${data.aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-1"
    Env        = "Prod"
    Owner      = "mahesh"
    CostCenter = "ABCD"
  }
}

terraform {
  backend "s3" {
    bucket = "masteringcloudmahesh"
    key    = "Current-state.tfstate"
    region = "ap-south-1"
  }
}
