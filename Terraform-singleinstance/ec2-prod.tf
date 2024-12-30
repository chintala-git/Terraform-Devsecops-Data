resource "aws_instance" "web-1" {
  ami                         = "ami-053b12d3152c0cc71"
  availability_zone           = "ap-south-1a"
  instance_type               = "t2.micro"
  key_name                    = "dev_key"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Prod-Server"
    Env        = "Prod"
    Owner      = "mahesh"
    CostCenter = "ABCD"
  }
}
