resource "aws_s3_bucket" "b" {
  bucket = "matube75"

  tags = {
    Name        = "jenkins-bucket"
    Environment = "Dev"
  }
}
