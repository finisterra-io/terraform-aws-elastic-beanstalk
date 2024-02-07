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
| <a name="input_additional_settings"></a> [additional\_settings](#input\_additional\_settings) | Additional Elastic Beanstalk setttings. For full list of options, see https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html | <pre>list(object({<br>    namespace = string<br>    name      = string<br>    value     = string<br>  }))</pre> | `[]` | no |
| <a name="input_alb_zone_id"></a> [alb\_zone\_id](#input\_alb\_zone\_id) | ALB zone id | `map(string)` | <pre>{<br>  "af-south-1": "Z1EI3BVKMKK4AM",<br>  "ap-east-1": "ZPWYUBWRU171A",<br>  "ap-northeast-1": "Z1R25G3KIG2GBW",<br>  "ap-northeast-2": "Z3JE5OI70TWKCP",<br>  "ap-south-1": "Z18NTBI3Y7N9TZ",<br>  "ap-southeast-1": "Z16FZ9L249IFLT",<br>  "ap-southeast-2": "Z2PCDNR3VC2G1N",<br>  "ca-central-1": "ZJFCZL7SSZB5I",<br>  "eu-central-1": "Z1FRNW7UH4DEZJ",<br>  "eu-north-1": "Z23GO28BZ5AETM",<br>  "eu-south-1": "Z10VDYYOA2JFKM",<br>  "eu-west-1": "Z2NYPWQ7DFZAZH",<br>  "eu-west-2": "Z1GKAAAUGATPF1",<br>  "eu-west-3": "Z3Q77PNBQS71R4",<br>  "me-south-1": "Z2BBTEKR2I36N2",<br>  "sa-east-1": "Z10X7K2B4QSOFV",<br>  "us-east-1": "Z117KPS5GTRQ2G",<br>  "us-east-2": "Z14LCN19Q5QHIC",<br>  "us-gov-east-1": "Z2NIFVYYW2VKV1",<br>  "us-gov-west-1": "Z31GFT0UA1I2HV",<br>  "us-west-1": "Z1LQECGX5PH1X",<br>  "us-west-2": "Z38NKT9BP95V3O"<br>}</pre> | no |
| <a name="input_allow_all_egress"></a> [allow\_all\_egress](#input\_allow\_all\_egress) | If `true`, the created security group will allow egress on all ports and protocols to all IP addresses.<br>If this is false and no egress rules are otherwise specified, then no egress will be allowed. | `bool` | `true` | no |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | The id of the AMI to associate with the Amazon EC2 instances | `string` | `null` | no |
| <a name="input_application_port"></a> [application\_port](#input\_application\_port) | Port application is listening on | `number` | `80` | no |
| <a name="input_application_subnets"></a> [application\_subnets](#input\_application\_subnets) | List of subnets to place EC2 instances | `list(string)` | `[]` | no |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Whether to associate public IP addresses to the instances | `bool` | `false` | no |
| <a name="input_associated_security_group_ids"></a> [associated\_security\_group\_ids](#input\_associated\_security\_group\_ids) | A list of IDs of Security Groups to associate the created resource with, in addition to the created security group.<br>These security groups will not be modified and, if `create_security_group` is `false`, must have rules providing the desired access. | `list(string)` | `[]` | no |
| <a name="input_autoscale_lower_bound"></a> [autoscale\_lower\_bound](#input\_autoscale\_lower\_bound) | Minimum level of autoscale metric to remove an instance | `number` | `20` | no |
| <a name="input_autoscale_lower_increment"></a> [autoscale\_lower\_increment](#input\_autoscale\_lower\_increment) | How many Amazon EC2 instances to remove when performing a scaling activity. | `number` | `-1` | no |
| <a name="input_autoscale_max"></a> [autoscale\_max](#input\_autoscale\_max) | Maximum instances to launch | `number` | `3` | no |
| <a name="input_autoscale_measure_name"></a> [autoscale\_measure\_name](#input\_autoscale\_measure\_name) | Metric used for your Auto Scaling trigger | `string` | `"CPUUtilization"` | no |
| <a name="input_autoscale_min"></a> [autoscale\_min](#input\_autoscale\_min) | Minumum instances to launch | `number` | `2` | no |
| <a name="input_autoscale_statistic"></a> [autoscale\_statistic](#input\_autoscale\_statistic) | Statistic the trigger should use, such as Average | `string` | `"Average"` | no |
| <a name="input_autoscale_unit"></a> [autoscale\_unit](#input\_autoscale\_unit) | Unit for the trigger measurement, such as Bytes | `string` | `"Percent"` | no |
| <a name="input_autoscale_upper_bound"></a> [autoscale\_upper\_bound](#input\_autoscale\_upper\_bound) | Maximum level of autoscale metric to add an instance | `number` | `80` | no |
| <a name="input_autoscale_upper_increment"></a> [autoscale\_upper\_increment](#input\_autoscale\_upper\_increment) | How many Amazon EC2 instances to add when performing a scaling activity | `number` | `1` | no |
| <a name="input_availability_zone_selector"></a> [availability\_zone\_selector](#input\_availability\_zone\_selector) | Availability Zone selector | `string` | `"Any 2"` | no |
| <a name="input_create_ec2_role"></a> [create\_ec2\_role](#input\_create\_ec2\_role) | Create a ec2 role for Elastic Beanstalk to use | `bool` | `false` | no |
| <a name="input_create_instance_profile"></a> [create\_instance\_profile](#input\_create\_instance\_profile) | Create a instance profile for Elastic Beanstalk to use | `bool` | `false` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Create a security group for the DocumentDB cluster | `bool` | `false` | no |
| <a name="input_create_service_role"></a> [create\_service\_role](#input\_create\_service\_role) | Create a service role for Elastic Beanstalk to use | `bool` | `false` | no |
| <a name="input_deployment_batch_size"></a> [deployment\_batch\_size](#input\_deployment\_batch\_size) | Percentage or fixed number of Amazon EC2 instances in the Auto Scaling group on which to simultaneously perform deployments. Valid values vary per deployment\_batch\_size\_type setting | `number` | `1` | no |
| <a name="input_deployment_batch_size_type"></a> [deployment\_batch\_size\_type](#input\_deployment\_batch\_size\_type) | The type of number that is specified in deployment\_batch\_size\_type | `string` | `"Fixed"` | no |
| <a name="input_deployment_ignore_health_check"></a> [deployment\_ignore\_health\_check](#input\_deployment\_ignore\_health\_check) | Do not cancel a deployment due to failed health checks | `bool` | `false` | no |
| <a name="input_deployment_policy"></a> [deployment\_policy](#input\_deployment\_policy) | Use the DeploymentPolicy option to set the deployment type. The following values are supported: `AllAtOnce`, `Rolling`, `RollingWithAdditionalBatch`, `Immutable`, `TrafficSplitting` | `string` | `"Rolling"` | no |
| <a name="input_deployment_timeout"></a> [deployment\_timeout](#input\_deployment\_timeout) | Number of seconds to wait for an instance to complete executing commands | `number` | `600` | no |
| <a name="input_description"></a> [description](#input\_description) | Short description of the Environment | `string` | `""` | no |
| <a name="input_dns_subdomain"></a> [dns\_subdomain](#input\_dns\_subdomain) | The subdomain to create on Route53 for the EB environment. For the subdomain to be created, the `dns_zone_id` variable must be set as well | `string` | `""` | no |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | Route53 parent zone ID. The module will create sub-domain DNS record in the parent zone for the EB environment | `string` | `""` | no |
| <a name="input_ec2_iam_policy_arns"></a> [ec2\_iam\_policy\_arns](#input\_ec2\_iam\_policy\_arns) | List of IAM policy ARNs to attach to the ec2 role | `list(string)` | `[]` | no |
| <a name="input_ec2_iam_role_assume_role_policy"></a> [ec2\_iam\_role\_assume\_role\_policy](#input\_ec2\_iam\_role\_assume\_role\_policy) | IAM policy document describing the ec2 role's trust relationship | `string` | `""` | no |
| <a name="input_ec2_iam_role_description"></a> [ec2\_iam\_role\_description](#input\_ec2\_iam\_role\_description) | Description of the ec2 role to create | `string` | `""` | no |
| <a name="input_ec2_iam_role_name"></a> [ec2\_iam\_role\_name](#input\_ec2\_iam\_role\_name) | Name of the ec2 role to create | `string` | `""` | no |
| <a name="input_ec2_iam_role_tags"></a> [ec2\_iam\_role\_tags](#input\_ec2\_iam\_role\_tags) | Tags to apply to the ec2 role | `map(string)` | `{}` | no |
| <a name="input_elastic_beanstalk_application_name"></a> [elastic\_beanstalk\_application\_name](#input\_elastic\_beanstalk\_application\_name) | Elastic Beanstalk application name | `string` | n/a | yes |
| <a name="input_elb_scheme"></a> [elb\_scheme](#input\_elb\_scheme) | Specify `internal` if you want to create an internal load balancer in your Amazon VPC so that your Elastic Beanstalk application cannot be accessed from outside your Amazon VPC | `string` | `"public"` | no |
| <a name="input_enable_capacity_rebalancing"></a> [enable\_capacity\_rebalancing](#input\_enable\_capacity\_rebalancing) | Specifies whether to enable the Capacity Rebalancing feature for Spot Instances in your Auto Scaling Group | `bool` | `false` | no |
| <a name="input_enable_loadbalancer_logs"></a> [enable\_loadbalancer\_logs](#input\_enable\_loadbalancer\_logs) | Whether to enable Load Balancer Logging to the S3 bucket. | `bool` | `true` | no |
| <a name="input_enable_log_publication_control"></a> [enable\_log\_publication\_control](#input\_enable\_log\_publication\_control) | Copy the log files for your application's Amazon EC2 instances to the Amazon S3 bucket associated with your application | `bool` | `false` | no |
| <a name="input_enable_spot_instances"></a> [enable\_spot\_instances](#input\_enable\_spot\_instances) | Enable Spot Instance requests for your environment | `bool` | `false` | no |
| <a name="input_enable_stream_logs"></a> [enable\_stream\_logs](#input\_enable\_stream\_logs) | Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| <a name="input_enhanced_reporting_enabled"></a> [enhanced\_reporting\_enabled](#input\_enhanced\_reporting\_enabled) | Whether to enable "enhanced" health reporting for this environment.  If false, "basic" reporting is used.  When you set this to false, you must also set `enable_managed_actions` to false | `bool` | `true` | no |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | Map of custom ENV variables to be provided to the application running on Elastic Beanstalk, e.g. env\_vars = { DB\_USER = 'admin' DB\_PASS = 'xxxxxx' } | `map(string)` | `{}` | no |
| <a name="input_environment_type"></a> [environment\_type](#input\_environment\_type) | Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `loadbalancer_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments) | `string` | `"LoadBalanced"` | no |
| <a name="input_extended_ec2_policy_document"></a> [extended\_ec2\_policy\_document](#input\_extended\_ec2\_policy\_document) | Extensions or overrides for the IAM role assigned to EC2 instances | `string` | `""` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Force destroy the S3 bucket for load balancer logs | `bool` | `false` | no |
| <a name="input_health_streaming_delete_on_terminate"></a> [health\_streaming\_delete\_on\_terminate](#input\_health\_streaming\_delete\_on\_terminate) | Whether to delete the log group when the environment is terminated. If false, the health data is kept RetentionInDays days. | `bool` | `false` | no |
| <a name="input_health_streaming_enabled"></a> [health\_streaming\_enabled](#input\_health\_streaming\_enabled) | For environments with enhanced health reporting enabled, whether to create a group in CloudWatch Logs for environment health and archive Elastic Beanstalk environment health data. For information about enabling enhanced health, see aws:elasticbeanstalk:healthreporting:system. | `bool` | `false` | no |
| <a name="input_health_streaming_retention_in_days"></a> [health\_streaming\_retention\_in\_days](#input\_health\_streaming\_retention\_in\_days) | The number of days to keep the archived health data before it expires. | `number` | `7` | no |
| <a name="input_healthcheck_healthy_threshold_count"></a> [healthcheck\_healthy\_threshold\_count](#input\_healthcheck\_healthy\_threshold\_count) | The number of consecutive successful requests before Elastic Load Balancing changes the instance health status | `number` | `3` | no |
| <a name="input_healthcheck_httpcodes_to_match"></a> [healthcheck\_httpcodes\_to\_match](#input\_healthcheck\_httpcodes\_to\_match) | List of HTTP codes that indicate that an instance is healthy. Note that this option is only applicable to environments with a network or application load balancer | `list(string)` | <pre>[<br>  "200"<br>]</pre> | no |
| <a name="input_healthcheck_interval"></a> [healthcheck\_interval](#input\_healthcheck\_interval) | The interval of time, in seconds, that Elastic Load Balancing checks the health of the Amazon EC2 instances of your application | `number` | `10` | no |
| <a name="input_healthcheck_timeout"></a> [healthcheck\_timeout](#input\_healthcheck\_timeout) | The amount of time, in seconds, to wait for a response during a health check. Note that this option is only applicable to environments with an application load balancer | `number` | `5` | no |
| <a name="input_healthcheck_unhealthy_threshold_count"></a> [healthcheck\_unhealthy\_threshold\_count](#input\_healthcheck\_unhealthy\_threshold\_count) | The number of consecutive unsuccessful requests before Elastic Load Balancing changes the instance health status | `number` | `3` | no |
| <a name="input_healthcheck_url"></a> [healthcheck\_url](#input\_healthcheck\_url) | Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances | `string` | `"/"` | no |
| <a name="input_http_listener_enabled"></a> [http\_listener\_enabled](#input\_http\_listener\_enabled) | Enable port 80 (http) | `bool` | `true` | no |
| <a name="input_instance_profile_name"></a> [instance\_profile\_name](#input\_instance\_profile\_name) | Name of the instance profile to create | `string` | `""` | no |
| <a name="input_instance_profile_tags"></a> [instance\_profile\_tags](#input\_instance\_profile\_tags) | Tags to apply to the instance profile | `map(string)` | `{}` | no |
| <a name="input_instance_refresh_enabled"></a> [instance\_refresh\_enabled](#input\_instance\_refresh\_enabled) | Enable weekly instance replacement. | `bool` | `true` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instances type | `string` | `"t2.micro"` | no |
| <a name="input_keypair"></a> [keypair](#input\_keypair) | Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS | `string` | `""` | no |
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
| <a name="input_logs_delete_on_terminate"></a> [logs\_delete\_on\_terminate](#input\_logs\_delete\_on\_terminate) | Whether to delete the log groups when the environment is terminated. If false, the logs are kept RetentionInDays days | `bool` | `false` | no |
| <a name="input_logs_retention_in_days"></a> [logs\_retention\_in\_days](#input\_logs\_retention\_in\_days) | The number of days to keep log events before they expire. | `number` | `7` | no |
| <a name="input_managed_actions_enabled"></a> [managed\_actions\_enabled](#input\_managed\_actions\_enabled) | Enable managed platform updates. When you set this to true, you must also specify a `PreferredStartTime` and `UpdateLevel` | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Elastic Beanstalk environment | `string` | n/a | yes |
| <a name="input_prefer_legacy_service_policy"></a> [prefer\_legacy\_service\_policy](#input\_prefer\_legacy\_service\_policy) | Whether to use AWSElasticBeanstalkService (deprecated) or AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy policy | `bool` | `true` | no |
| <a name="input_prefer_legacy_ssm_policy"></a> [prefer\_legacy\_ssm\_policy](#input\_prefer\_legacy\_ssm\_policy) | Whether to use AmazonEC2RoleforSSM (will soon be deprecated) or AmazonSSMManagedInstanceCore policy | `bool` | `true` | no |
| <a name="input_preferred_start_time"></a> [preferred\_start\_time](#input\_preferred\_start\_time) | Configure a maintenance window for managed actions in UTC | `string` | `"Sun:10:00"` | no |
| <a name="input_rolling_update_enabled"></a> [rolling\_update\_enabled](#input\_rolling\_update\_enabled) | Whether to enable rolling update | `bool` | `true` | no |
| <a name="input_rolling_update_type"></a> [rolling\_update\_type](#input\_rolling\_update\_type) | `Health` or `Immutable`. Set it to `Immutable` to apply the configuration change to a fresh group of instances | `string` | `"Health"` | no |
| <a name="input_root_volume_iops"></a> [root\_volume\_iops](#input\_root\_volume\_iops) | The IOPS of the EBS root volume (only applies for gp3 and io1 types) | `number` | `null` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | The size of the EBS root volume | `number` | `8` | no |
| <a name="input_root_volume_throughput"></a> [root\_volume\_throughput](#input\_root\_volume\_throughput) | The type of the EBS root volume (only applies for gp3 type) | `number` | `null` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | The type of the EBS root volume | `string` | `"gp2"` | no |
| <a name="input_s3_bucket_access_log_bucket_name"></a> [s3\_bucket\_access\_log\_bucket\_name](#input\_s3\_bucket\_access\_log\_bucket\_name) | Name of the S3 bucket where s3 access log will be sent to | `string` | `""` | no |
| <a name="input_s3_bucket_versioning_enabled"></a> [s3\_bucket\_versioning\_enabled](#input\_s3\_bucket\_versioning\_enabled) | When set to 'true' the s3 origin bucket will have versioning enabled | `bool` | `true` | no |
| <a name="input_scheduled_actions"></a> [scheduled\_actions](#input\_scheduled\_actions) | Define a list of scheduled actions | <pre>list(object({<br>    name            = string<br>    minsize         = string<br>    maxsize         = string<br>    desiredcapacity = string<br>    starttime       = string<br>    endtime         = string<br>    recurrence      = string<br>    suspend         = bool<br>  }))</pre> | `[]` | no |
| <a name="input_security_group_create_before_destroy"></a> [security\_group\_create\_before\_destroy](#input\_security\_group\_create\_before\_destroy) | Set `true` to enable Terraform `create_before_destroy` behavior on the created security group.<br>We recommend setting this `true` on new security groups, but default it to `false` because `true`<br>will cause existing security groups to be replaced, possibly requiring the resource to be deleted and recreated.<br>Note that changing this value will always cause the security group to be replaced. | `bool` | `false` | no |
| <a name="input_security_group_create_timeout"></a> [security\_group\_create\_timeout](#input\_security\_group\_create\_timeout) | How long to wait for the security group to be created. | `string` | `"10m"` | no |
| <a name="input_security_group_delete_timeout"></a> [security\_group\_delete\_timeout](#input\_security\_group\_delete\_timeout) | How long to retry on `DependencyViolation` errors during security group deletion from<br>lingering ENIs left by certain AWS services such as Elastic Load Balancing. | `string` | `"15m"` | no |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | The description to assign to the created Security Group.<br>Warning: Changing the description causes the security group to be replaced. | `string` | `"Security Group for the EB environment"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The name to assign to the created security group. Must be unique within the VPC. | `string` | `""` | no |
| <a name="input_security_group_tags"></a> [security\_group\_tags](#input\_security\_group\_tags) | Additional tags for the security group to create for the DocumentDB cluster | `map(string)` | `{}` | no |
| <a name="input_service_iam_policy_arns"></a> [service\_iam\_policy\_arns](#input\_service\_iam\_policy\_arns) | List of IAM policy ARNs to attach to the service role | `list(string)` | `[]` | no |
| <a name="input_service_iam_role_assume_role_policy"></a> [service\_iam\_role\_assume\_role\_policy](#input\_service\_iam\_role\_assume\_role\_policy) | IAM policy document describing the service role's trust relationship | `string` | `""` | no |
| <a name="input_service_iam_role_description"></a> [service\_iam\_role\_description](#input\_service\_iam\_role\_description) | Description of the service role to create | `string` | `""` | no |
| <a name="input_service_iam_role_name"></a> [service\_iam\_role\_name](#input\_service\_iam\_role\_name) | Name of the service role to create | `string` | `""` | no |
| <a name="input_service_iam_role_tags"></a> [service\_iam\_role\_tags](#input\_service\_iam\_role\_tags) | Tags to apply to the service role | `map(string)` | `{}` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | Define a list of all settings | <pre>list(object({<br>    namespace = string<br>    name      = string<br>    value     = string<br>    resource  = string<br>  }))</pre> | `[]` | no |
| <a name="input_shared_loadbalancer_arn"></a> [shared\_loadbalancer\_arn](#input\_shared\_loadbalancer\_arn) | ARN of the shared application load balancer. Only when loadbalancer\_type = "application". | `string` | `""` | no |
| <a name="input_solution_stack_name"></a> [solution\_stack\_name](#input\_solution\_stack\_name) | Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. For more info, see https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html | `string` | `""` | no |
| <a name="input_spot_fleet_on_demand_above_base_percentage"></a> [spot\_fleet\_on\_demand\_above\_base\_percentage](#input\_spot\_fleet\_on\_demand\_above\_base\_percentage) | The percentage of On-Demand Instances as part of additional capacity that your Auto Scaling group provisions beyond the SpotOnDemandBase instances. This option is relevant only when enable\_spot\_instances is true. | `number` | `-1` | no |
| <a name="input_spot_fleet_on_demand_base"></a> [spot\_fleet\_on\_demand\_base](#input\_spot\_fleet\_on\_demand\_base) | The minimum number of On-Demand Instances that your Auto Scaling group provisions before considering Spot Instances as your environment scales up. This option is relevant only when enable\_spot\_instances is true. | `number` | `0` | no |
| <a name="input_spot_max_price"></a> [spot\_max\_price](#input\_spot\_max\_price) | The maximum price per unit hour, in US$, that you're willing to pay for a Spot Instance. This option is relevant only when enable\_spot\_instances is true. Valid values are between 0.001 and 20.0 | `number` | `-1` | no |
| <a name="input_ssh_listener_enabled"></a> [ssh\_listener\_enabled](#input\_ssh\_listener\_enabled) | Enable SSH port | `bool` | `false` | no |
| <a name="input_ssh_listener_port"></a> [ssh\_listener\_port](#input\_ssh\_listener\_port) | SSH port | `number` | `22` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Elastic Beanstalk Environment tier, 'WebServer' or 'Worker' | `string` | `"WebServer"` | no |
| <a name="input_update_level"></a> [update\_level](#input\_update\_level) | The highest level of update to apply with managed platform updates | `string` | `"minor"` | no |
| <a name="input_updating_max_batch"></a> [updating\_max\_batch](#input\_updating\_max\_batch) | Maximum number of instances to update at once | `number` | `1` | no |
| <a name="input_updating_min_in_service"></a> [updating\_min\_in\_service](#input\_updating\_min\_in\_service) | Minimum number of instances in service during update | `number` | `1` | no |
| <a name="input_version_label"></a> [version\_label](#input\_version\_label) | Elastic Beanstalk Application version to deploy | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC in which to provision the AWS resources | `string` | `""` | no |
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
