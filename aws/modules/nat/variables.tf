variable "name" {
  description = "NAT Gateway 이름"
  type        = string
}

variable "public_subnet_id" {
  description = "NAT가 연결될 퍼블릭 서브넷 ID"
  type        = string
}
