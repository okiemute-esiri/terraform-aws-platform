variable "aws_region" {
  description = "AWS region for the platform."
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Project name used for resource naming and tags."
  type        = string
  default     = "portfolio-platform"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.40.0.0/16"
}

variable "instance_type" {
  description = "EC2 instance type for application nodes."
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Minimum application instance count."
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum application instance count."
  type        = number
  default     = 4
}

variable "desired_capacity" {
  description = "Desired application instance count."
  type        = number
  default     = 2
}
