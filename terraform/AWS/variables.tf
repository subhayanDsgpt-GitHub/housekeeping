# Author:           Subhayan Dasgupta
# Date Created:     24/01/2024
# Date Modified:    25/01/2024

# Description:
# Defining variables to parameterize the Terraform resources.

# Usage:
# variables.tf.

variable "prefix" {
  type        = string
  description = "Use the following default string as a prefix for naming the AWS managed resources."
  default     = "SubhayanDsPoC"
}

variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "Use secrets.tfvars only to pass the secrets securely invoked locally. Use ENVIRONMENT_VARIABLES in Terraform Cloud."
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "Use secrets.tfvars only to pass the secrets securely invoked locally. Use ENVIRONMENT_VARIABLES in Terraform Cloud."
  sensitive   = true
}

variable "AWS_REGION" {
  type        = string
  description = "Choose an AWS Region to deploy the managed resources."
}
