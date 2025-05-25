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
  description = "SG for server_2"
  vpc_id      = var.vpc_id
}
