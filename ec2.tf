resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  monitoring = true
  ebs_optimized = true
  root_block_device {
  encrypted     = true
}

  metadata_options {     
      http_endpoint = "enabled"
      http_tokens   = "required"
 }
  tags = {
    Name = "airbnb-web-server-instance"
  }
}