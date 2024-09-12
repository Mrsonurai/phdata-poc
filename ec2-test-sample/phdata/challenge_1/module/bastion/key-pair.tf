resource "tls_private_key" "bastion-private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_secretsmanager_secret" "bastion-key-pair" {
  name                    = "${var.entity-name}-bastion-secret"
  description             = "Bastion host private key"
  recovery_window_in_days = 0

  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "bastion-key-pair" {
  secret_id     = aws_secretsmanager_secret.bastion-key-pair.id
  secret_string = tls_private_key.bastion-private-key.private_key_pem
}

resource "aws_key_pair" "bastion-key" {
  key_name   = "${var.entity-name}-bastion-key"
  public_key = tls_private_key.bastion-private-key.public_key_openssh
}
