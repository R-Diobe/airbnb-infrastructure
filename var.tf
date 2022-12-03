variable "ami_id" {
  type = string
  description = "ami id"
  default = "ami-0b0dcb5067f052a63"
}



variable "instance_type" {
  type = string
  description = "type of ec2 instance"
  default = "t2.micro"
}