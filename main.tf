resource "aws_security_group" "tf_sg" {
  name        = "tf_sg"
  description = "Allow HTTPS to web server"
  vpc_id      = "vpc-05bdcc8880aab85ab"

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    
  }
 ingress {
    description = "TLS from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "web" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}



resource "aws_instance" "demo" {
  ami           = "var.ami_id"  
  instance_type = "var.instance_type"
  security_groups = [aws_security_group.sm_tg.name]
  tags = var.instance_tags
  
}
