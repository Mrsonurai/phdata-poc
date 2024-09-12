terraform {
  backend "s3" {
    region         = "us-west-1"
    bucket         = "ec2-test-bucket-ph"
    dynamodb_table = "ec2-test-bucket-ph-lock"
    key            = "test"
  }
}
