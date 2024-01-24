variable "aws_account_id" {
  description = "The AWS account ID for provisioning resources."
  default     = "changeme"
}

variable "region" {
  description = "The AWS region for provisioning resources."
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The ID of the default VPC for provisioning resources."
  default     = "changeme"
}

variable "subnet_id" {
  description = "The ID of a default public subnet for provisioning resources."
  default     = "changeme"
}

variable "security_group_name" {
  description = "The name for the EC2 security group that will be provisioned."
  default     = "changeme"
}

variable "keypair_name" {
  description = "The SSH keypair name for EC2 SSH connections."
  default     = "change_me_ssh"
}

variable "keypair_file" {
  description = "The SSH keypair file path for EC2 SSH connections."
  default     = "pubkeys/change_me_ssh.pem.pub"
}
