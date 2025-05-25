resource "aws_instance" "server_1" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  private_ip    = "100.100.100.2"
  vpc_security_group_ids = [aws_security_group.server_1_sg.id]

  tags = {
    Name = "SERVER_1"
  }
}

resource "aws_security_group" "server_1_sg" {
  name        = "server_1-sg"
  description = "SG for server_1"
  vpc_id      = var.vpc_id
}
