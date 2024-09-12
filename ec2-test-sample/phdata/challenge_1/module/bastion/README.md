<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eip.bastion-public-ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip_association.eip_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.bastion-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_secretsmanager_secret.bastion-key-pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.bastion-key-pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [tls_private_key.bastion-private-key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [template_file.startup](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance-type"></a> [instance-type](#input\_instance-type) | (Optional) Preferred instance type. Defaults to t3.micro | `string` | `"t3.micro"` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | (Required) Subnet ID where to place the bastion host | `string` | n/a | yes |
| <a name="input_security-groups"></a> [security-groups](#input\_security-groups) | (Required) List of security groups to attach | `list(string)` | n/a | yes |
| <a name="input_ami-id"></a> [ami-id](#input\_ami-id) | (Optional) AMI ID to override calculated value | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | (Optional) AWS Region where resources are located | `string` | `"us-east-1"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Application component / environment | `string` | `"common"` | no |
| <a name="input_entity-name"></a> [entity-name](#input\_entity-name) | (Required) Component identifier (web, api, etc.) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key-pair-name"></a> [key-pair-name](#output\_key-pair-name) | Name of the key pair used to connect to the bastion host |
| <a name="output_bastion-ip"></a> [bastion-ip](#output\_bastion-ip) | Public IP of bastion host |
| <a name="output_bastion-private-key"></a> [bastion-private-key](#output\_bastion-private-key) | Name of the SSM secret where you can find the private key from key-pair |
| <a name="output_bastion-private-key-data"></a> [bastion-private-key-data](#output\_bastion-private-key-data) | Private key data to access the instance |
<!-- END_TF_DOCS -->