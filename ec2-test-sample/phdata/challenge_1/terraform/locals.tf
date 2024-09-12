locals {
  name-prefix  = "${var.entity-name}-${var.environment}"
  bastion-name = "${local.name-prefix}-bastion"

  programmatic-user-name = "programmatic-access-user"

  vpcs = aws_vpc.main_vpc.id

  tags = merge(
    var.tags,
    {
      Component   = var.entity-name
      Environment = var.environment
      Region      = var.region
      Terraform   = true
    }
  )
}
