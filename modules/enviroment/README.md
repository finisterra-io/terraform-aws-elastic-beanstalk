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
| <a name="input_elb_scheme"></a> [elb\_scheme](#input\_elb\_scheme) | Specify `internal` if you want to create an internal load balancer in your Amazon VPC so that your Elastic Beanstalk application cannot be accessed from outside your Amazon VPC | `string` | `"public"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| <a name="input_environment_type"></a> [environment\_type](#input\_environment\_type) | Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `loadbalancer_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments) | `string` | `"LoadBalanced"` | no |
| <a name="input_healthcheck_healthy_threshold_count"></a> [healthcheck\_healthy\_threshold\_count](#input\_healthcheck\_healthy\_threshold\_count) | The number of consecutive successful requests before Elastic Load Balancing changes the instance health status | `number` | `3` | no |
| <a name="input_healthcheck_httpcodes_to_match"></a> [healthcheck\_httpcodes\_to\_match](#input\_healthcheck\_httpcodes\_to\_match) | List of HTTP codes that indicate that an instance is healthy. Note that this option is only applicable to environments with a network or application load balancer | `list(string)` | <pre>[<br>  "200"<br>]</pre> | no |
| <a name="input_healthcheck_interval"></a> [healthcheck\_interval](#input\_healthcheck\_interval) | The interval of time, in seconds, that Elastic Load Balancing checks the health of the Amazon EC2 instances of your application | `number` | `10` | no |
| <a name="input_healthcheck_timeout"></a> [healthcheck\_timeout](#input\_healthcheck\_timeout) | The amount of time, in seconds, to wait for a response during a health check. Note that this option is only applicable to environments with an application load balancer | `number` | `5` | no |
| <a name="input_healthcheck_unhealthy_threshold_count"></a> [healthcheck\_unhealthy\_threshold\_count](#input\_healthcheck\_unhealthy\_threshold\_count) | The number of consecutive unsuccessful requests before Elastic Load Balancing changes the instance health status | `number` | `3` | no |
| <a name="input_healthcheck_url"></a> [healthcheck\_url](#input\_healthcheck\_url) | Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances | `string` | `"/"` | no |
| <a name="input_http_listener_enabled"></a> [http\_listener\_enabled](#input\_http\_listener\_enabled) | Enable port 80 (http) | `bool` | `true` | no |
| <a name="input_loadbalancer_certificate_arn"></a> [loadbalancer\_certificate\_arn](#input\_loadbalancer\_certificate\_arn) | Load Balancer SSL certificate ARN. The certificate must be present in AWS Certificate Manager | `string` | `""` | no |
| <a name="input_loadbalancer_connection_idle_timeout"></a> [loadbalancer\_connection\_idle\_timeout](#input\_loadbalancer\_connection\_idle\_timeout) | Classic load balancer only: Number of seconds that the load balancer waits for any data to be sent or received over the connection. If no data has been sent or received after this time period elapses, the load balancer closes the connection. | `number` | `60` | no |
| <a name="input_loadbalancer_crosszone"></a> [loadbalancer\_crosszone](#input\_loadbalancer\_crosszone) | Configure the classic load balancer to route traffic evenly across all instances in all Availability Zones rather than only within each zone. | `bool` | `true` | no |
| <a name="input_loadbalancer_is_shared"></a> [loadbalancer\_is\_shared](#input\_loadbalancer\_is\_shared) | Flag to create a shared application loadbalancer. Only when loadbalancer\_type = "application" https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-cfg-alb-shared.html | `bool` | `false` | no |
| <a name="input_loadbalancer_managed_security_group"></a> [loadbalancer\_managed\_security\_group](#input\_loadbalancer\_managed\_security\_group) | Load balancer managed security group | `string` | `""` | no |
| <a name="input_loadbalancer_redirect_http_to_https"></a> [loadbalancer\_redirect\_http\_to\_https](#input\_loadbalancer\_redirect\_http\_to\_https) | Redirect HTTP traffic to HTTPS listener | `bool` | `false` | no |
| <a name="input_loadbalancer_redirect_http_to_https_host"></a> [loadbalancer\_redirect\_http\_to\_https\_host](#input\_loadbalancer\_redirect\_http\_to\_https\_host) | Defines the host for the HTTP to HTTPS redirection rule | `string` | `"#{host}"` | no |
| <a name="input_loadbalancer_redirect_http_to_https_path_pattern"></a> [loadbalancer\_redirect\_http\_to\_https\_path\_pattern](#input\_loadbalancer\_redirect\_http\_to\_https\_path\_pattern) | Defines the path pattern for the HTTP to HTTPS redirection rule | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_loadbalancer_redirect_http_to_https_port"></a> [loadbalancer\_redirect\_http\_to\_https\_port](#input\_loadbalancer\_redirect\_http\_to\_https\_port) | Defines the port for the HTTP to HTTPS redirection rule | `string` | `"443"` | no |
| <a name="input_loadbalancer_redirect_http_to_https_priority"></a> [loadbalancer\_redirect\_http\_to\_https\_priority](#input\_loadbalancer\_redirect\_http\_to\_https\_priority) | Defines the priority for the HTTP to HTTPS redirection rule | `number` | `1` | no |
| <a name="input_loadbalancer_redirect_http_to_https_status_code"></a> [loadbalancer\_redirect\_http\_to\_https\_status\_code](#input\_loadbalancer\_redirect\_http\_to\_https\_status\_code) | The redirect status code | `string` | `"HTTP_301"` | no |
| <a name="input_loadbalancer_security_groups"></a> [loadbalancer\_security\_groups](#input\_loadbalancer\_security\_groups) | Load balancer security groups | `list(string)` | `[]` | no |
| <a name="input_loadbalancer_ssl_policy"></a> [loadbalancer\_ssl\_policy](#input\_loadbalancer\_ssl\_policy) | Specify a security policy to apply to the listener. This option is only applicable to environments with an application load balancer | `string` | `""` | no |
| <a name="input_loadbalancer_subnets"></a> [loadbalancer\_subnets](#input\_loadbalancer\_subnets) | List of subnets to place Elastic Load Balancer | `list(string)` | `[]` | no |
| <a name="input_loadbalancer_type"></a> [loadbalancer\_type](#input\_loadbalancer\_type) | Load Balancer type, e.g. 'application' or 'classic' | `string` | `"classic"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Elastic Beanstalk environment | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | Define a list of all settings | <pre>list(object({<br>    namespace = string<br>    name      = string<br>    value     = string<br>    resource  = string<br>  }))</pre> | `[]` | no |
| <a name="input_shared_loadbalancer_arn"></a> [shared\_loadbalancer\_arn](#input\_shared\_loadbalancer\_arn) | ARN of the shared application load balancer. Only when loadbalancer\_type = "application". | `string` | `""` | no |
| <a name="input_solution_stack_name"></a> [solution\_stack\_name](#input\_solution\_stack\_name) | Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. For more info, see https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html | `string` | `""` | no |
| <a name="input_ssh_listener_enabled"></a> [ssh\_listener\_enabled](#input\_ssh\_listener\_enabled) | Enable SSH port | `bool` | `false` | no |
| <a name="input_ssh_listener_port"></a> [ssh\_listener\_port](#input\_ssh\_listener\_port) | SSH port | `number` | `22` | no |
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
