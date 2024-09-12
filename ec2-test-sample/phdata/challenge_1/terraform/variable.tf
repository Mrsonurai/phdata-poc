# ### bastion variables

variable "instance-type" {
  description = "(Optional) Bastion host instance type. Defaults to t3.micro"
  default     = "t3.micro"
}

variable "region" {
  description = "(Optional) AWS Region where resources are located"
  default     = "us-east-1"
  type        = string
}

variable "environment" {
  description = "(Required) Application environment"
  type        = string
}

variable "entity-name" {
  description = "(Required) Component identifier (web, api, etc.)"
  type        = string
}

variable "ami-id" {
  description = "(Optional) AMI ID to override calculated value"
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable "web-account-id" {
  description = "(Required) Striim SaaS APP account id"
  type        = string
}
