resource "aws_instance" "firewall_2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  private_ip    = "198.51.100.1"
  vpc_security_group_ids = [aws_security_group.firewall2_sg.id]

  tags = {
    Name = "FW2"
  }
}

resource "aws_security_group" "firewall2_sg" {
  name        = "fw2-sg"
  description = "Firewall 2 Security Group"
  vpc_id      = var.vpc_id
}
