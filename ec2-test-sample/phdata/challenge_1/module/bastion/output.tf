output "key-pair-name" {
  value       = aws_key_pair.bastion-key.key_name
  description = "Name of the key pair used to connect to the bastion host"
}

output "bastion-ip" {
  value       = aws_eip.bastion-public-ip.public_ip
  description = "Public IP of bastion host"
}

output "bastion-private-key" {
  value       = aws_secretsmanager_secret.bastion-key-pair.name
  description = "Name of the SSM secret where you can find the private key from key-pair"
}

output "bastion-private-key-data" {
  value       = aws_secretsmanager_secret_version.bastion-key-pair.secret_string
  description = "Private key data to access the instance"
}
