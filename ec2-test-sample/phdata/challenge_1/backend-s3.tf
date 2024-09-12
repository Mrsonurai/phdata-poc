## Bucket creatuon for S3 and eanabling the state lock

provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "ec2-test-bucket-ph"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Test"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "ec2-test-bucket-ph-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "Test"
  }
}
