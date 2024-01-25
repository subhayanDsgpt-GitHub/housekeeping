# Author:           Subhayan Dasgupta
# Date Created:     24/01/2024
# Date Modified:    25/01/2024

# Description:
# Deploy AWS managed resources using Terraform.

# Usage:
#
# Commands to deploy: 
# terraform init -upgrade
# terraform plan <aws_resource_name>_deployment.tfplan
# terraform apply <aws_resource_name>_deployment.tfplan
#
# Commands to destroy or clean up:
# terraform plan <aws_resource_name>_deployment.destroy.tfplan
# terraform apply <aws_resource_name>_deployment.destroy.tfplan
#
# Acknowledgement: https://registry.terraform.io/providers/hashicorp/aws/latest

# Use AWS Terraform provider.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  # access_key = var.AWS_ACCESS_KEY_ID # Use ENVIRONMENT_VARIABLES on Terraform Cloud to store and pass the credentials securely.
  # secret_key = var.AWS_SECRET_ACCESS_KEY # Use ENVIRONMENT_VARIABLES on Terraform Cloud to store and pass the credentials securely.
  # region     = var.AWS_REGION # Use ENVIRONMENT_VARIABLES on Terraform Cloud.
}
