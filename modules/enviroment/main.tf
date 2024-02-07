locals {
  # Remove `Name` tag from the map of tags because Elastic Beanstalk generates the `Name` tag automatically
  # and if it is provided, terraform tries to recreate the application on each `plan/apply`
  # `Namespace` should be removed as well since any string that contains `Name` forces recreation
  # https://github.com/terraform-providers/terraform-provider-aws/issues/3963
  tags = { for t in keys(var.tags) : t => var.tags[t] if t != "Name" && t != "Namespace" }

  classic_elb_settings = [
    {
      namespace = "aws:elb:loadbalancer"
      name      = "CrossZone"
      value     = var.loadbalancer_crosszone
    },
    {
      namespace = "aws:elb:loadbalancer"
      name      = "SecurityGroups"
      value     = join(",", sort(var.loadbalancer_security_groups))
    },
    {
      namespace = "aws:elb:loadbalancer"
      name      = "ManagedSecurityGroup"
      value     = var.loadbalancer_managed_security_group
    },

    {
      namespace = "aws:elb:listener"
      name      = "ListenerProtocol"
      value     = "HTTP"
    },
    {
      namespace = "aws:elb:listener"
      name      = "InstancePort"
      value     = var.application_port
    },
    {
      namespace = "aws:elb:listener"
      name      = "ListenerEnabled"
      value     = var.http_listener_enabled || var.loadbalancer_certificate_arn == "" ? "true" : "false"
    },
    {
      namespace = "aws:elb:listener:443"
      name      = "ListenerProtocol"
      value     = "HTTPS"
    },
    {
      namespace = "aws:elb:listener:443"
      name      = "InstancePort"
      value     = var.application_port
    },
    {
      namespace = "aws:elb:listener:443"
      name      = "SSLCertificateId"
      value     = var.loadbalancer_certificate_arn
    },
    {
      namespace = "aws:elb:listener:443"
      name      = "ListenerEnabled"
      value     = var.loadbalancer_certificate_arn == "" ? "false" : "true"
    },
    {
      namespace = "aws:elb:listener:${var.ssh_listener_port}"
      name      = "ListenerProtocol"
      value     = "TCP"
    },
    {
      namespace = "aws:elb:listener:${var.ssh_listener_port}"
      name      = "InstancePort"
      value     = "22"
    },
    {
      namespace = "aws:elb:listener:${var.ssh_listener_port}"
      name      = "ListenerEnabled"
      value     = var.ssh_listener_enabled
    },
    {
      namespace = "aws:elb:policies"
      name      = "ConnectionSettingIdleTimeout"
      value     = var.loadbalancer_connection_idle_timeout
    },
    {
      namespace = "aws:elb:policies"
      name      = "ConnectionDrainingEnabled"
      value     = "true"
    },
  ]

  generic_alb_settings = [
    {
      namespace = "aws:elbv2:loadbalancer"
      name      = "SecurityGroups"
      value     = join(",", sort(var.loadbalancer_security_groups))
    }
  ]

  shared_alb_settings = [
    {
      namespace = "aws:elasticbeanstalk:environment"
      name      = "LoadBalancerIsShared"
      value     = "true"
    },
    {
      namespace = "aws:elbv2:loadbalancer"
      name      = "SharedLoadBalancer"
      value     = var.shared_loadbalancer_arn
    }
  ]

  alb_settings = [
    {
      namespace = "aws:elbv2:listener:default"
      name      = "ListenerEnabled"
      value     = var.http_listener_enabled || var.loadbalancer_certificate_arn == "" ? "true" : "false"
    },
    {
      namespace = "aws:elbv2:loadbalancer"
      name      = "ManagedSecurityGroup"
      value     = var.loadbalancer_managed_security_group
    },
    {
      namespace = "aws:elbv2:listener:443"
      name      = "ListenerEnabled"
      value     = var.loadbalancer_certificate_arn == "" ? "false" : "true"
    },
    {
      namespace = "aws:elbv2:listener:443"
      name      = "Protocol"
      value     = "HTTPS"
    },
    {
      namespace = "aws:elbv2:listener:443"
      name      = "SSLCertificateArns"
      value     = var.loadbalancer_certificate_arn
    },
    {
      namespace = "aws:elbv2:listener:443"
      name      = "SSLPolicy"
      value     = var.loadbalancer_type == "application" ? var.loadbalancer_ssl_policy : ""
    },
    ###===================== Application Load Balancer Health check settings =====================================================###
    # The Application Load Balancer health check does not take into account the Elastic Beanstalk health check path
    # http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-cfg-applicationloadbalancer.html
    # http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-cfg-applicationloadbalancer.html#alb-default-process.config
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "HealthCheckPath"
      value     = var.healthcheck_url
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "MatcherHTTPCode"
      value     = join(",", sort(var.healthcheck_httpcodes_to_match))
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "HealthCheckTimeout"
      value     = var.healthcheck_timeout
    }
  ]


  nlb_settings = [
    {
      namespace = "aws:elbv2:listener:default"
      name      = "ListenerEnabled"
      value     = var.http_listener_enabled
    }
  ]

  # Settings for all loadbalancer types (including shared ALB)
  generic_elb_settings = [
    {
      namespace = "aws:elasticbeanstalk:environment"
      name      = "LoadBalancerType"
      value     = var.loadbalancer_type
    }
  ]

  # Settings for beanstalk managed elb only (so not for shared ALB)
  beanstalk_elb_settings = [
    {
      namespace = "aws:ec2:vpc"
      name      = "ELBSubnets"
      value     = join(",", sort(var.loadbalancer_subnets))
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "Port"
      value     = var.application_port
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "Protocol"
      value     = var.loadbalancer_type == "network" ? "TCP" : "HTTP"
    },
    {
      namespace = "aws:ec2:vpc"
      name      = "ELBScheme"
      value     = var.environment_type == "LoadBalanced" ? var.elb_scheme : ""
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "HealthCheckInterval"
      value     = var.healthcheck_interval
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "HealthyThresholdCount"
      value     = var.healthcheck_healthy_threshold_count
    },
    {
      namespace = "aws:elasticbeanstalk:environment:process:default"
      name      = "UnhealthyThresholdCount"
      value     = var.healthcheck_unhealthy_threshold_count
    }
  ]

  # Select elb configuration depending on loadbalancer_type
  elb_settings_nlb        = var.loadbalancer_type == "network" ? concat(local.nlb_settings, local.generic_elb_settings, local.beanstalk_elb_settings) : []
  elb_settings_alb        = var.loadbalancer_type == "application" && !var.loadbalancer_is_shared ? concat(local.alb_settings, local.generic_alb_settings, local.generic_elb_settings, local.beanstalk_elb_settings) : []
  elb_settings_shared_alb = var.loadbalancer_type == "application" && var.loadbalancer_is_shared ? concat(local.shared_alb_settings, local.generic_alb_settings, local.generic_elb_settings) : []
  elb_setting_classic     = var.loadbalancer_type == "classic" ? concat(local.classic_elb_settings, local.generic_elb_settings, local.beanstalk_elb_settings) : []

  # If the tier is "WebServer" add the elb_settings, otherwise exclude them
  elb_settings_final = var.tier == "WebServer" ? concat(local.elb_settings_nlb, local.elb_settings_alb, local.elb_settings_shared_alb, local.elb_setting_classic) : []
}

#
# Full list of options:
# http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html#command-options-general-elasticbeanstalkmanagedactionsplatformupdate
#
resource "aws_elastic_beanstalk_environment" "default" {
  count = var.enabled ? 1 : 0

  name                   = var.name
  application            = var.elastic_beanstalk_application_name
  description            = var.description
  tier                   = var.tier
  solution_stack_name    = var.solution_stack_name
  wait_for_ready_timeout = var.wait_for_ready_timeout
  version_label          = var.version_label
  tags                   = local.tags

  dynamic "setting" {
    for_each = var.settings
    content {
      name      = setting.value["name"]
      namespace = setting.value["namespace"]
      resource  = ""
      value     = setting.value["value"]
    }
  }
}

data "aws_lb_listener" "http" {
  count             = var.enabled && var.loadbalancer_redirect_http_to_https ? 1 : 0
  load_balancer_arn = var.loadbalancer_is_shared ? var.shared_loadbalancer_arn : one(aws_elastic_beanstalk_environment.default[0].load_balancers)
  port              = var.application_port
}

resource "aws_lb_listener_rule" "redirect_http_to_https" {
  count        = var.enabled && var.loadbalancer_redirect_http_to_https ? 1 : 0
  listener_arn = one(data.aws_lb_listener.http[*].arn)
  priority     = var.loadbalancer_redirect_http_to_https_priority

  condition {
    path_pattern {
      values = var.loadbalancer_redirect_http_to_https_path_pattern
    }
  }

  action {
    type = "redirect"
    redirect {
      host        = var.loadbalancer_redirect_http_to_https_host
      port        = var.loadbalancer_redirect_http_to_https_port
      protocol    = "HTTPS"
      status_code = var.loadbalancer_redirect_http_to_https_status_code
    }
  }
}
