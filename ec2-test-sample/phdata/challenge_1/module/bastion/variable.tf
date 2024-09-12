variable "instance-type" {
  default     = "t3.micro"
  description = "(Optional) Preferred instance type. Defaults to t3.micro"
  type        = string
}

variable "subnet" {
  description = "(Required) Subnet ID where to place the bastion host"
  type        = string
}

variable "security-groups" {
  description = "(Required) List of security groups to attach"
  type        = list(string)
}

variable "ami-id" {
  description = "(Optional) AMI ID to override calculated value"
  type        = string
  default     = null
}
# ### =============================
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable "region" {
  description = "(Optional) AWS Region where resources are located"
  default     = "us-east-1"
}

variable "environment" {
  description = "(Required) Application component / environment"
  type        = string
  default     = "common"
}

variable "entity-name" {
  description = "(Required) Component identifier (web, api, etc.)"
  type        = string
}
