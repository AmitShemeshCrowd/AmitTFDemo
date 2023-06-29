resource "aws_security_group" "main" {
  name        = "terraform-main"
  vpc_id      = aws_vpc.main.id
  description = "Allow all inbound traffic and SSH"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}