# Secrets

This Terraform module is used to create a VPC with private and public subnets.

If there are public subnets then an Internet Gateway and corresponding Route Table with Route are created. Each public subnet gets its own Elastic IP, NAT Gateway, and Route Table Association.

The VPC ID and Subnet IDs are output from the module allowing them to be referenced by consumers of the module.

## Example usage

```
module "networking" {
  source = "git::https://github.com/Chia-Explorer/networking?ref=1.0.0"

  vpc_cidr_block       = "11.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  private_subnets = [{
    availability_zone = "${var.region}a"
    cidr_block        = "11.0.1.0/24"
    }, {
    availability_zone = "${var.region}b"
    cidr_block        = "11.0.2.0/24"
  }]
  public_subnets = [{
    availability_zone = "${var.region}a"
    cidr_block        = "11.0.3.0/24"
    }, {
    availability_zone = "${var.region}b"
    cidr_block        = "11.0.4.0/24"
  }]
}
```
