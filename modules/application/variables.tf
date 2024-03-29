variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "name" {
  type        = string
  description = "Elastic Beanstalk Application name"
}

variable "description" {
  type        = string
  default     = ""
  description = "Elastic Beanstalk Application description"
}

variable "appversion_lifecycle_service_role_arn" {
  type        = string
  description = "The service role ARN to use for application version cleanup. If left empty, the `appversion_lifecycle` block will not be created"
  default     = ""
}

variable "appversion_lifecycle_max_count" {
  type        = number
  default     = 1000
  description = "The max number of application versions to keep"
}

variable "appversion_lifecycle_delete_source_from_s3" {
  type        = bool
  default     = false
  description = "Whether to delete application versions from S3 source"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources"
}
