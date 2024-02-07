# enviroment

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elastic_beanstalk_environment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_environment) | resource |
| [aws_lb_listener_rule.redirect_http_to_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lb_listener) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_port"></a> [application\_port](#input\_application\_port) | Port application is listening on | `number` | `80` | no |
| <a name="input_description"></a> [description](#input\_description) | Short description of the Environment | `string` | `""` | no |
| <a name="input_elastic_beanstalk_application_name"></a> [elastic\_beanstalk\_application\_name](#input\_elastic\_beanstalk\_application\_name) | Elastic Beanstalk application name | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| <a name="input_loadbalancer_is_shared"></a> [loadbalancer\_is\_shared](#input\_loadbalancer\_is\_shared) | Flag to create a shared application loadbalancer. Only when loadbalancer\_type = "application" https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-cfg-alb-shared.html | `bool` | `false` | no |
| <a name="input_loadbalancer_redirect_http_to_https"></a> [loadbalancer\_redirect\_http\_to\_https](#input\_loadbalancer\_redirect\_http\_to\_https) | Redirect HTTP traffic to HTTPS listener | `bool` | `false` | no |
| <a name="input_loadbalancer_redirect_http_to_https_host"></a> [loadbalancer\_redirect\_http\_to\_https\_host](#input\_loadbalancer\_redirect\_http\_to\_https\_host) | Defines the host for the HTTP to HTTPS redirection rule | `string` | `"#{host}"` | no |
| <a name="input_loadbalancer_redirect_http_to_https_path_pattern"></a> [loadbalancer\_redirect\_http\_to\_https\_path\_pattern](#input\_loadbalancer\_redirect\_http\_to\_https\_path\_pattern) | Defines the path pattern for the HTTP to HTTPS redirection rule | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_loadbalancer_redirect_http_to_https_port"></a> [loadbalancer\_redirect\_http\_to\_https\_port](#input\_loadbalancer\_redirect\_http\_to\_https\_port) | Defines the port for the HTTP to HTTPS redirection rule | `string` | `"443"` | no |
| <a name="input_loadbalancer_redirect_http_to_https_priority"></a> [loadbalancer\_redirect\_http\_to\_https\_priority](#input\_loadbalancer\_redirect\_http\_to\_https\_priority) | Defines the priority for the HTTP to HTTPS redirection rule | `number` | `1` | no |
| <a name="input_loadbalancer_redirect_http_to_https_status_code"></a> [loadbalancer\_redirect\_http\_to\_https\_status\_code](#input\_loadbalancer\_redirect\_http\_to\_https\_status\_code) | The redirect status code | `string` | `"HTTP_301"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Elastic Beanstalk environment | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | Define a list of all settings | <pre>list(object({<br>    namespace = string<br>    name      = string<br>    value     = string<br>    resource  = string<br>  }))</pre> | `[]` | no |
| <a name="input_shared_loadbalancer_arn"></a> [shared\_loadbalancer\_arn](#input\_shared\_loadbalancer\_arn) | ARN of the shared application load balancer. Only when loadbalancer\_type = "application". | `string` | `""` | no |
| <a name="input_solution_stack_name"></a> [solution\_stack\_name](#input\_solution\_stack\_name) | Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. For more info, see https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Elastic Beanstalk Environment tier, 'WebServer' or 'Worker' | `string` | `"WebServer"` | no |
| <a name="input_version_label"></a> [version\_label](#input\_version\_label) | Elastic Beanstalk Application version to deploy | `string` | `""` | no |
| <a name="input_wait_for_ready_timeout"></a> [wait\_for\_ready\_timeout](#input\_wait\_for\_ready\_timeout) | The maximum duration to wait for the Elastic Beanstalk Environment to be in a ready state before timing out | `string` | `"20m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_settings"></a> [all\_settings](#output\_all\_settings) | List of all option settings configured in the environment. These are a combination of default settings and their overrides from setting in the configuration |
| <a name="output_application"></a> [application](#output\_application) | The Elastic Beanstalk Application for this environment |
| <a name="output_autoscaling_groups"></a> [autoscaling\_groups](#output\_autoscaling\_groups) | The autoscaling groups used by this environment |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Fully qualified DNS name for the environment |
| <a name="output_id"></a> [id](#output\_id) | ID of the Elastic Beanstalk environment |
| <a name="output_instances"></a> [instances](#output\_instances) | Instances used by this environment |
| <a name="output_launch_configurations"></a> [launch\_configurations](#output\_launch\_configurations) | Launch configurations in use by this environment |
| <a name="output_load_balancers"></a> [load\_balancers](#output\_load\_balancers) | Elastic Load Balancers in use by this environment |
| <a name="output_name"></a> [name](#output\_name) | Name of the Elastic Beanstalk environment |
| <a name="output_queues"></a> [queues](#output\_queues) | SQS queues in use by this environment |
| <a name="output_setting"></a> [setting](#output\_setting) | Settings specifically set for this environment |
| <a name="output_tier"></a> [tier](#output\_tier) | The environment tier |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | Autoscaling triggers in use by this environment |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
