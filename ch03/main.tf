provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state"

  # Preven accidental deletation of this S3 bucket lifecyle
  lifecycle {
    prevent_destroy = true
  }

  # Enable versioning so we can see the full revision history
  # of our state files
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_instance" "chapter_03_instance" {
    ami           = "ami-0fc20dd1da406780b"
    instance_type = "t2.micro"
}

