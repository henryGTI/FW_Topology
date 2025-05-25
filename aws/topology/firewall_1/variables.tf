variable "vpc_id" {
  description = "VPC ID to associate with resources"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 placement"
  type        = string
}
