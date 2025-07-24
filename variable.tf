variable "ami_id" {
  type    = string
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  type    = list(string)
  default = ["t2.micro", "t2.medium"]
}
variable "instance_tags" {
  type    = map(any)
  default = {
    Name  = "Sonal"
    Team  = "DevOps"
  }
}




