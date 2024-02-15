output "id" {
  value       = join("", aws_elastic_beanstalk_environment.default[*].id)
  description = "ID of the Elastic Beanstalk environment"
}

output "name" {
  value       = join("", aws_elastic_beanstalk_environment.default[*].name)
  description = "Name of the Elastic Beanstalk environment"
}

output "tier" {
  value       = join("", aws_elastic_beanstalk_environment.default[*].tier)
  description = "The environment tier"
}

output "application" {
  value       = join("", aws_elastic_beanstalk_environment.default[*].application)
  description = "The Elastic Beanstalk Application for this environment"
}

output "setting" {
  value       = try(aws_elastic_beanstalk_environment.default[0].setting, [])
  description = "Settings specifically set for this environment"
}

output "all_settings" {
  value       = try(aws_elastic_beanstalk_environment.default[0].all_settings, [])
  description = "List of all option settings configured in the environment. These are a combination of default settings and their overrides from setting in the configuration"
}

output "endpoint" {
  value       = join("", aws_elastic_beanstalk_environment.default[*].cname)
  description = "Fully qualified DNS name for the environment"
}

output "autoscaling_groups" {
  value       = try(aws_elastic_beanstalk_environment.default[0].autoscaling_groups, [])
  description = "The autoscaling groups used by this environment"
}

output "instances" {
  value       = try(aws_elastic_beanstalk_environment.default[*].instances, [])
  description = "Instances used by this environment"
}

output "launch_configurations" {
  value       = try(aws_elastic_beanstalk_environment.default[*].launch_configurations, [])
  description = "Launch configurations in use by this environment"
}

output "load_balancers" {
  value       = try(aws_elastic_beanstalk_environment.default[0].load_balancers, [])
  description = "Elastic Load Balancers in use by this environment"
}

output "queues" {
  value       = try(aws_elastic_beanstalk_environment.default[*].queues, [])
  description = "SQS queues in use by this environment"
}

output "triggers" {
  value       = try(aws_elastic_beanstalk_environment.default[*].triggers, [])
  description = "Autoscaling triggers in use by this environment"
}
