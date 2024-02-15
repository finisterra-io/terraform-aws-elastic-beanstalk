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

variable "application_port" {
  type        = number
  default     = 80
  description = "Port application is listening on"
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
