# application

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elastic_beanstalk_application.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_application) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appversion_lifecycle_delete_source_from_s3"></a> [appversion\_lifecycle\_delete\_source\_from\_s3](#input\_appversion\_lifecycle\_delete\_source\_from\_s3) | Whether to delete application versions from S3 source | `bool` | `false` | no |
| <a name="input_appversion_lifecycle_max_count"></a> [appversion\_lifecycle\_max\_count](#input\_appversion\_lifecycle\_max\_count) | The max number of application versions to keep | `number` | `1000` | no |
| <a name="input_appversion_lifecycle_service_role_arn"></a> [appversion\_lifecycle\_service\_role\_arn](#input\_appversion\_lifecycle\_service\_role\_arn) | The service role ARN to use for application version cleanup. If left empty, the `appversion_lifecycle` block will not be created | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | Elastic Beanstalk Application description | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Elastic Beanstalk Application name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elastic_beanstalk_application_name"></a> [elastic\_beanstalk\_application\_name](#output\_elastic\_beanstalk\_application\_name) | Elastic Beanstalk Application name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
