# Example only. Copy to backend.tf and replace values after creating the
# remote-state infrastructure outside this stack.
#
# terraform {
#   backend "s3" {
#     bucket       = "replace-with-terraform-state-bucket"
#     key          = "terraform-aws-platform/dev/terraform.tfstate"
#     region       = "eu-west-1"
#     encrypt      = true
#     use_lockfile = true
#   }
# }
