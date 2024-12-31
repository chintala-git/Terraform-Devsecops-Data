resource "aws_s3_bucket" "mahesh0001" {
  bucket = "mahesh0001"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "mahesh0002" {
  bucket = "mahesh0002"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "mahesh0003" {
  bucket = "mahesh0003"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
