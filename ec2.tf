resource "aws_instance" "ec2_demo" {
  count             = 1
  ami               = "ami-0e820afa569e84cc1"
  instance_type     = var.ec2_instance_type
  availability_zone = var.availability_zone.a

  tags = {
    Name = "Demo-${random_string.id.result}"
  }
#  lifecycle {
#    prevent_destroy = true
#  }
}

resource "aws_instance" "ec2_lcoals_demo" {
  ami               = local.locals-ami
  instance_type     = var.ec2_instance_type
  availability_zone = var.availability_zone.b

  tags = {
    Name = "Locals-Demo-${random_string.id.result}"
  }
#  lifecycle {
#    prevent_destroy = true
#  }
}

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

