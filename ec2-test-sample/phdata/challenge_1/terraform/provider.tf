terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}

provider "aws" {
  # profile = "aws-web-stg-PAU-new" # Uncomment for selecting differnet profile[env] for aws configure list-profile from local. This is will help to execute the resources in the env we want.
  region = var.region
}
