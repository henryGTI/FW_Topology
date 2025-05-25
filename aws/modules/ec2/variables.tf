variable "name" {
  description = "EC2 인스턴스 이름"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "인스턴스 타입"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "서브넷 ID"
  type        = string
}
