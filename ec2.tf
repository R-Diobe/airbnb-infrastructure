resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  monitoring = true
  ebs_optimized = true

  tags = {
    Name = "airbnb-web-server"
  }
}