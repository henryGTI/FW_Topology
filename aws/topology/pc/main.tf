resource "aws_instance" "pc" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  private_ip    = "10.10.10.2"
  vpc_security_group_ids = [aws_security_group.pc_sg.id]

  tags = {
    Name = "PC"
  }
}

resource "aws_security_group" "pc_sg" {
  name        = "pc-sg"
  description = "SG for pc"
  vpc_id      = var.vpc_id
}
