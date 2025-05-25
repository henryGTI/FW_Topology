resource "aws_instance" "server_3" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  private_ip    = "198.51.100.2"
  vpc_security_group_ids = [aws_security_group.server_3_sg.id]

  tags = {
    Name = "SERVER_3"
  }
}

resource "aws_security_group" "server_3_sg" {
  name        = "server_3-sg"
  description = "SG for server_3"
  vpc_id      = var.vpc_id
}
