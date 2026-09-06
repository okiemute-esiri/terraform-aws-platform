# Terraform AWS Platform

Modular Terraform project for repeatable AWS application infrastructure.

## Status

This repository contains a working Infrastructure-as-Code design that can be initialized and validated without deploying cloud resources. It models a production-oriented AWS application environment using reusable Terraform modules.

No AWS infrastructure is claimed to be live. Applying this configuration will create billable AWS resources, so review the plan and costs before deployment.

## Architecture

```text
Internet
   |
Application Load Balancer
   |
Auto Scaling Group
   |
EC2 application instances
   |
Private application subnets

VPC
├── public subnet A
├── public subnet B
├── private subnet A
└── private subnet B
```

## Implemented

- Terraform version/provider constraints
- AWS provider configuration
- reusable `network` module
- reusable `compute` module
- multi-AZ VPC design
- public and private subnets
- Internet Gateway and routing
- Application Load Balancer
- Launch Template
- Auto Scaling Group
- least-privilege-oriented security groups
- configurable instance size and capacity
- environment tagging
- example remote-state backend configuration
- example environment variable file
- GitHub Actions Terraform validation

## Repository Structure

```text
.
├── modules/
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── compute/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   └── dev.tfvars.example
├── .github/workflows/terraform.yml
├── backend.example.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
└── versions.tf
```

## Validation

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
```

## Planning

Copy the example variables file before planning:

```bash
cp environments/dev.tfvars.example environments/dev.tfvars
terraform init -backend=false
terraform plan -var-file=environments/dev.tfvars
```

A real deployment should use authenticated AWS credentials supplied outside source control.

## Remote State

`backend.example.tf` documents the intended S3 remote-state pattern. Bucket and state-locking resources are deliberately not auto-created by this stack because Terraform backends must exist before normal backend initialization.

## Security Design

The load balancer accepts HTTP traffic on port 80. Application instances accept application traffic only from the load-balancer security group. Application instances are placed in private subnets and receive no public IP addresses.

For production evolution, add TLS/ACM, HTTPS-only listeners, WAF, Systems Manager access, encrypted EBS configuration, centralized logging and policy-as-code checks.

## Cost Notice

Running this configuration can create EC2, Application Load Balancer and related AWS resources that incur charges. `terraform validate` and CI validation do not deploy resources.

## Portfolio Focus

This repository demonstrates Infrastructure as Code, Terraform module design, AWS networking, compute orchestration, scaling, configuration management and CI validation. It does not claim a currently running production AWS environment.
