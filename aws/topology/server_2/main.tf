resource "aws_instance" "server_2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  private_ip    = "203.0.113.2"
  vpc_security_group_ids = [aws_security_group.server_2_sg.id]

  tags = {
    Name = "SERVER_2"
  }
}

resource "aws_security_group" "server_2_sg" {
  name        = "server_2-sg"
  description = "SG for server_2 with restricted access"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow RDP from admin IP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.10/32"]
  }

  ingress {
    description = "Allow SSH from jump host"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.100/32"]
  }

  ingress {
    description = "Allow HTTP from internal network"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "server_2-sg"
  }
}
