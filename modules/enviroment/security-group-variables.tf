variable "associated_security_group_ids" {
  type        = list(string)
  default     = []
  description = <<-EOT
    A list of IDs of Security Groups to associate the created resource with, in addition to the created security group.
    These security groups will not be modified and, if `create_security_group` is `false`, must have rules providing the desired access.
    EOT
}


variable "security_group_tags" {
  type        = map(string)
  description = "Additional tags for the security group to create for the DocumentDB cluster"
  default     = {}
}


variable "create_security_group" {
  type        = bool
  default     = false
  description = "Create a security group for the DocumentDB cluster"
}

variable "security_group_name" {
  type        = string
  default     = ""
  description = "The name to assign to the created security group. Must be unique within the VPC."
}

variable "security_group_description" {
  type        = string
  default     = "Security Group for the EB environment"
  description = <<-EOT
    The description to assign to the created Security Group.
    Warning: Changing the description causes the security group to be replaced.
    EOT
}

variable "security_group_create_before_destroy" {
  type = bool

  default     = false
  description = <<-EOT
    Set `true` to enable Terraform `create_before_destroy` behavior on the created security group.
    We recommend setting this `true` on new security groups, but default it to `false` because `true`
    will cause existing security groups to be replaced, possibly requiring the resource to be deleted and recreated.
    Note that changing this value will always cause the security group to be replaced.
    EOT
}

variable "security_group_create_timeout" {
  type        = string
  default     = "10m"
  description = "How long to wait for the security group to be created."
}

variable "security_group_delete_timeout" {
  type        = string
  default     = "15m"
  description = <<-EOT
    How long to retry on `DependencyViolation` errors during security group deletion from
    lingering ENIs left by certain AWS services such as Elastic Load Balancing.
    EOT
}

variable "allow_all_egress" {
  type        = bool
  default     = true
  description = <<-EOT
    If `true`, the created security group will allow egress on all ports and protocols to all IP addresses.
    If this is false and no egress rules are otherwise specified, then no egress will be allowed.
    EOT
}
