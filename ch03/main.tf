provider "aws" {
  region = "us-east-2"
}

variable "server_port" {
    description = "The port the server will to HTTP requests"
    type        = number
}

resource "aws_launch_configuration" "example" {
    image_id                    = "ami-0fc20dd1da406780b"
    instance_type          = "t2.micro"
    security_groups = [aws_security_group.instance.id]
    
    user_data = <<-EOF
                #!/bin/bash
                echo "Hello World!" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF

    # Required when using a launch configuration with an auto scaling group.
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group" "instance" {
    name = "terraform-example-instance"

    ingress {
        from_port   = var.server_port
        to_port     = var.server_port
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_autoscaling_group" "example" {
    launch_configuration = aws_launch_configuration.example.name

    min_size = 2
    max_size = 10  

    tag {
        key                 = "Name"
        value               = "terraform-asg-example"
        propagate_at_launch = true
    }
}


output "public_ip" {
  value = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}

