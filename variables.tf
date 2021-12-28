variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block of VPC"
}

variable "enable_dns_support" {
  type        = bool
  description = "Whether or not to enable DNS support on the VPC"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Whether or not to enable DNS hostnames on the VPC"
}

variable "private_subnets" {
  type        = list(object({ availability_zone = string, cidr_block = string }))
  description = "Subnets which do not have access to or from the internet"
}

variable "public_subnets" {
  type        = list(object({ availability_zone = string, cidr_block = string }))
  description = "Subnets which get an Elastic IP and NAT Gateway allowing bidirectional communication over the internet"
}
