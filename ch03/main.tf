provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "chapter_03_instance" {
    ami           = "ami-0fc20dd1da406780b"
    instance_type = "t2.micro"
}
