resource "aws_instance" "ec2_demo" {
  count             = 1
  ami               = "ami-03f38e546e3dc59e1"
  instance_type     = var.ec2_instance_type
  availability_zone = var.availability_zone.a
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.main.id]
  user_data     = <<-EOF
                    #!/bin/bash
                    # Use this for your user data (script from top to bottom)
                    # Install httpd (Linux 2 version)
                    sudo yum update -y
                    sudo yum install -y httpd
                    sudo systemctl start httpd
                    sudo systemctl enable httpd
                    sudo bash -c 'echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html'
                  EOF

  tags = {
    Name = "Demo"
  }
#  lifecycle {
#    prevent_destroy = true
#  }
}

#resource "aws_instance" "ec2_lcoals_demo" {
#  ami               = local.locals-ami
#  instance_type     = var.ec2_instance_type
#  availability_zone = var.availability_zone.b
#
#  tags = {
#    Name = "Locals-Demo-${random_string.id.result}"
#  }
#  lifecycle {
#    prevent_destroy = true
#  }
#}

#resource "aws_instance" "ec2_demo_test_2" {
#  for_each = var.availability_zone
#
#  ami               = "ami-0e820afa569e84cc1"
#  instance_type     = var.ec2_instance_type
#  availability_zone = each.value
#
#  tags = {
#    Name = "For-each-Demo-${random_string.id.result}"
#  }
#}

