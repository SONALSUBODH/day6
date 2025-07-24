resource "aws_instance" "demo" {
  ami             = var.ami_id
  instance_type   = var.instance_type[0]
  tags            = var.instance_tags
  

}






