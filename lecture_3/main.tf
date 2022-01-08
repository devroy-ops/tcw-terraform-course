provider "aws"{
    region = "us-east-1"
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["subnet_2"]
  }
}

resource "aws_instance" "ec2_1" {
  ami           = "ami-0ec30f4db65328d5a"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.selected.id
  key_name = dev-account
  tags = {
    Name = "HelloWorld"
  }
}

###################################################################

variable "subnet_name" {
  description = "This is the name of the subnet"
  type = string
  default = "subnet_1"
}

variable "my_key" {
  type = string
  default = "dev-account"
}
