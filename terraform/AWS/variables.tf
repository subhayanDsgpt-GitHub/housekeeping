# Author:           Subhayan Dasgupta
<<<<<<< HEAD
# Date Created:     11/01/2024
# Date Modified:    22/01/2024
=======
# Date Created:     24/01/2024
# Date Modified:    24/01/2024
>>>>>>> 903aa87 (feature: Adding new AWS REST API Gateway terraform module.)

# Description:
# Defining variables to parameterize the Terraform resources.

# Usage:
# variables.tf.

<<<<<<< HEAD
variable "name" {
  type        = string
  description = "Use the following default string as a prefix for the AWS EKS cluster name."
  default     = "PoCKubernetesCluster"
}

variable "vpc_cidr" {
  type        = string
  description = "Use the following sample CIDR value for VPC"
  default     = "10.123.0.0/16"
}
=======
variable "prefix" {
  type        = string
  description = "Use the following string as prefix to any AWS resources."
  default     = "SubhayanDsPoC"
}

variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "Use secrets.tfvars to pass the secrets securely."
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "Use secrets.tfvars to pass the secrets securely."
  sensitive   = true
}

variable "AWS_REGION" {
  type        = string
  description = "Use a region to deploy your AWS resources."
}
>>>>>>> 903aa87 (feature: Adding new AWS REST API Gateway terraform module.)
