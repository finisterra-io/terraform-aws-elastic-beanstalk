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
  tags                   = var.tags

  dynamic "setting" {
    for_each = var.settings
    content {
      name      = setting.value["name"]
      namespace = setting.value["namespace"]
      resource  = ""
      value     = setting.value["value"]
    }
  }

  lifecycle {
    ignore_changes = [wait_for_ready_timeout]
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
