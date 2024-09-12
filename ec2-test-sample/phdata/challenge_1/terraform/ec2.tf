# Security Group for SSH Access
resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.207.232.74/32"]  # Replace with your public IP address
  }

  # Allow MySQL access on port 3307 from your public IP address
  ingress {
    from_port   = 3307
    to_port     = 3307
    protocol    = "tcp"
    cidr_blocks = ["49.207.232.74/32"]  # Replace with your public IP address
  }

  ingress {
    from_port   = 3307
    to_port     = 3307
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Whitelisting for BB pipeline to run into the VM
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

module "bastion" {
  # ### local source
  # source = "../../striim-modules/Bastion"
  # ### remote source
  source = "git@bitbucket.org:striim-saas/terramod-aws-ec2-test.git?ref=v0.1"

  instance-type = var.instance-type
  region        = var.region
  environment   = var.environment
  entity-name   = var.entity-name
  ami-id        = var.ami-id

  # subnet = data.aws_subnets.public.ids[0]
  subnet = aws_subnet.public_subnet.id

  security-groups = [
    aws_security_group.allow_ssh.id
  ]

  tags = merge(
    local.tags,
    {
      Name = local.bastion-name
    }
  )
}

resource "local_file" "private_key" {
  content              = module.bastion.bastion-private-key-data
  directory_permission = "0600"
  file_permission      = "0600"
  filename             = "private_key.pem"
}

# # not importable
# resource "null_resource" "MySQL" {
#   provisioner "local-exec" {
#     command = "bash -c utils/deployMYSQL.sh"
#   }

#   depends_on = [
#     module.bastion
#   ]
# }

# # Security Group for SSH Access
# resource "aws_security_group" "allow_ssh" {
#   vpc_id = aws_vpc.main_vpc.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["YOUR_PUBLIC_IP/32"]  # Replace with your public IP address
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_ssh"
#   }
# }

# # EC2 Instance (t2.micro)
# resource "aws_instance" "micro_instance" {
#   ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI (Update based on region)
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.public_subnet.id
#   key_name      = "my-key"  # Replace with your SSH key pair

#   vpc_security_group_ids = [aws_security_group.allow_ssh.id]

#   tags = {
#     Name = "MicroInstance"
#   }

#   # Output the public IP of the instance
#   output "instance_ip" {
#     value = aws_instance.micro_instance.public_ip
#   }
# }





# module "bastion" {
#   # ### local source
#   # source = "../../striim-modules/Bastion"
#   # ### remote source
#   source = "git@bitbucket.org:striim-saas/terramod-aws-bastion-host.git?ref=v1.1"

#   instance-type = var.instance-type
#   region        = var.region
#   environment   = var.environment
#   entity-name   = var.entity-name
#   # ami-id        = "ami-000722651477bd39b"
#   # ami-0fbca2ff2af24dc61 [#AMI FOR US-EAST-1 [STG]]
#   ami-id        = var.ami-id

#   subnet = data.aws_subnets.public.ids[0]

#   security-groups = [
#     data.aws_security_group.bastion-sg.id
#   ]

#   tags = merge(
#     local.tags,
#     {
#       Name = local.bastion-name
#     }
#   )
# }
