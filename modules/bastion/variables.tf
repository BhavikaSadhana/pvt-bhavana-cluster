variable "cluster_name" {
  type        = string
  description = "Cluster name for tagging resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC where bastion will be deployed"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "bastion_ami" {
  type        = string
  description = "AMI ID for Bastion Host"
}

variable "instance_type" {
  type        = string
  description = "Instance type for Bastion Host"
  default     = "t3.micro"
}

variable "ssh_cidr_blocks" {
  type        = list(string)
  description = "List of allowed CIDR blocks for SSH access"
}

variable "ssh_port" {
  type        = number
  description = "Port to allow for SSH access"
  default     = 22
}

variable "egress_cidr_blocks" {
  type        = list(string)
  description = "Egress CIDR blocks for bastion security group"
  default     = ["0.0.0.0/0"]
}
