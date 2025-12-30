Terraform AWS VPC Networking (Public + Private + NAT + Bastion)

This project demonstrates a real-world networking setup using Terraform:
- VPC
- Public + Private Subnets
- Internet Gateway
- NAT Gateway
- Bastion Host in Public Subnet
- Private EC2 (reachable only via bastion)
- Explicit Route Tables & Associations

Structure Design:
1) First deployed as a single-file implementation to validate networking behavior
2) Refactored into reusable Terraform modules for production-style infra

Modules follow separation of concerns:
- vpc
- subnets
- nat-gateway
- ec2-bastion
- ec2-private

This mirrors real DevOps workflows.
