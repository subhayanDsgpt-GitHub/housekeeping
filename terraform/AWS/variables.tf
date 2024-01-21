# Author:           Subhayan Dasgupta
# Date Created:     11/01/2024
# Date Modified:    22/01/2024

# Description:
# Hold the values for the variables which can be parameterized in main.tf.

# Usage:
# variables.tf.

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
