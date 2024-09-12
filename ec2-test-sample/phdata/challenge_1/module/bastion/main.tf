resource "aws_eip" "bastion-public-ip" {
  vpc = true

  tags = var.tags
}

# data "template_file" "startup" {
#   template = file("${path.module}/startup-scripts/startup.sh.tpl")
# }

# data "template_file" "startup" {
#   template = file("${path.module}/startup-scripts/deployMYSQL.sh")
# }

resource "aws_instance" "bastion" {
  instance_type                        = var.instance-type
  associate_public_ip_address          = true
  instance_initiated_shutdown_behavior = "terminate"
  key_name                             = aws_key_pair.bastion-key.key_name

  # user_data = base64encode(data.template_file.startup.rendered)

  # user_data = "${file("${path.module}/startup-scripts/deployMYSQL.sh")}"

  # ami                    = data.aws_ami.ubuntu.id
  ami                    = local.ami-id
  subnet_id              = var.subnet
  vpc_security_group_ids = var.security-groups

  volume_tags = var.tags
  tags        = var.tags
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.bastion.id
  allocation_id = aws_eip.bastion-public-ip.id
}
