resource "aws_instance" "firewall_1" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  private_ip    = "100.100.100.1"
  vpc_security_group_ids = [aws_security_group.firewall_sg.id]

  tags = {
    Name = "FW1"
  }
}

resource "aws_security_group" "firewall_sg" {
  name        = "fw1-sg"
  description = "Firewall 1 Security Group"
  vpc_id      = var.vpc_id
}
