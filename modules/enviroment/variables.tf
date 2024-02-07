variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the Elastic Beanstalk environment"
  type        = string
}

variable "description" {
  type        = string
  default     = ""
  description = "Short description of the Environment"
}

variable "elastic_beanstalk_application_name" {
  type        = string
  description = "Elastic Beanstalk application name"
}

variable "environment_type" {
  type        = string
  default     = "LoadBalanced"
  description = "Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `loadbalancer_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments)"
}

variable "loadbalancer_type" {
  type        = string
  default     = "classic"
  description = "Load Balancer type, e.g. 'application' or 'classic'"
}

variable "loadbalancer_is_shared" {
  type        = bool
  default     = false
  description = "Flag to create a shared application loadbalancer. Only when loadbalancer_type = \"application\" https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-cfg-alb-shared.html"
}

variable "shared_loadbalancer_arn" {
  type        = string
  default     = ""
  description = "ARN of the shared application load balancer. Only when loadbalancer_type = \"application\"."
}

variable "loadbalancer_crosszone" {
  type        = bool
  default     = true
  description = "Configure the classic load balancer to route traffic evenly across all instances in all Availability Zones rather than only within each zone."
}

variable "loadbalancer_connection_idle_timeout" {
  type        = number
  default     = 60
  description = "Classic load balancer only: Number of seconds that the load balancer waits for any data to be sent or received over the connection. If no data has been sent or received after this time period elapses, the load balancer closes the connection."
}

variable "loadbalancer_subnets" {
  type        = list(string)
  description = "List of subnets to place Elastic Load Balancer"
  default     = []
}

variable "solution_stack_name" {
  type        = string
  description = "Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. For more info, see https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html"
  default     = ""
}

variable "wait_for_ready_timeout" {
  type        = string
  default     = "20m"
  description = "The maximum duration to wait for the Elastic Beanstalk Environment to be in a ready state before timing out"
}

variable "tier" {
  type        = string
  default     = "WebServer"
  description = "Elastic Beanstalk Environment tier, 'WebServer' or 'Worker'"
}

variable "version_label" {
  type        = string
  default     = ""
  description = "Elastic Beanstalk Application version to deploy"
}

variable "healthcheck_url" {
  type        = string
  default     = "/"
  description = "Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances"
}

variable "loadbalancer_certificate_arn" {
  type        = string
  default     = ""
  description = "Load Balancer SSL certificate ARN. The certificate must be present in AWS Certificate Manager"
}

variable "loadbalancer_ssl_policy" {
  type        = string
  default     = ""
  description = "Specify a security policy to apply to the listener. This option is only applicable to environments with an application load balancer"
}

variable "loadbalancer_security_groups" {
  type        = list(string)
  default     = []
  description = "Load balancer security groups"
}

variable "loadbalancer_managed_security_group" {
  type        = string
  default     = ""
  description = "Load balancer managed security group"
}

variable "http_listener_enabled" {
  type        = bool
  default     = true
  description = "Enable port 80 (http)"
}

variable "application_port" {
  type        = number
  default     = 80
  description = "Port application is listening on"
}

variable "elb_scheme" {
  type        = string
  default     = "public"
  description = "Specify `internal` if you want to create an internal load balancer in your Amazon VPC so that your Elastic Beanstalk application cannot be accessed from outside your Amazon VPC"
}

variable "ssh_listener_enabled" {
  type        = bool
  default     = false
  description = "Enable SSH port"
}

variable "ssh_listener_port" {
  type        = number
  default     = 22
  description = "SSH port"
}

variable "healthcheck_interval" {
  type        = number
  default     = 10
  description = "The interval of time, in seconds, that Elastic Load Balancing checks the health of the Amazon EC2 instances of your application"
}

variable "healthcheck_timeout" {
  type        = number
  default     = 5
  description = "The amount of time, in seconds, to wait for a response during a health check. Note that this option is only applicable to environments with an application load balancer"
}

variable "healthcheck_healthy_threshold_count" {
  type        = number
  default     = 3
  description = "The number of consecutive successful requests before Elastic Load Balancing changes the instance health status"
}

variable "healthcheck_unhealthy_threshold_count" {
  type        = number
  default     = 3
  description = "The number of consecutive unsuccessful requests before Elastic Load Balancing changes the instance health status"
}

variable "healthcheck_httpcodes_to_match" {
  type        = list(string)
  default     = ["200"]
  description = "List of HTTP codes that indicate that an instance is healthy. Note that this option is only applicable to environments with a network or application load balancer"
}

variable "loadbalancer_redirect_http_to_https" {
  type        = bool
  default     = false
  description = "Redirect HTTP traffic to HTTPS listener"
}

variable "loadbalancer_redirect_http_to_https_priority" {
  type        = number
  default     = 1
  description = "Defines the priority for the HTTP to HTTPS redirection rule"
}

variable "loadbalancer_redirect_http_to_https_path_pattern" {
  type        = list(string)
  default     = ["*"]
  description = "Defines the path pattern for the HTTP to HTTPS redirection rule"
}

variable "loadbalancer_redirect_http_to_https_host" {
  type        = string
  default     = "#{host}"
  description = "Defines the host for the HTTP to HTTPS redirection rule"
}

variable "loadbalancer_redirect_http_to_https_port" {
  type        = string
  default     = "443"
  description = "Defines the port for the HTTP to HTTPS redirection rule"
}

variable "loadbalancer_redirect_http_to_https_status_code" {
  type        = string
  default     = "HTTP_301"
  description = "The redirect status code"

  validation {
    condition     = contains(["HTTP_301", "HTTP_302"], var.loadbalancer_redirect_http_to_https_status_code)
    error_message = "Allowed values are \"HTTP_301\" or \"HTTP_302\"."
  }
}

variable "settings" {
  type = list(object({
    namespace = string
    name      = string
    value     = string
    resource  = string
  }))
  default     = []
  description = "Define a list of all settings"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources"
}
