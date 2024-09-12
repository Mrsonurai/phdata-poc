locals {
  ami-id = var.ami-id != null ? var.ami-id : data.aws_ami.ubuntu.id
}