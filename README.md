# Secrets

This Terraform module is used to create a VPC with private and public subnets.

If there are public subnets then an Internet Gateway and corresponding Route Table with Route are created. Each public subnet gets its own Elastic IP, NAT Gateway, and Route Table Association.

## Example usage

```

```
