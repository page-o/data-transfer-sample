
variable "bucket" {
  type = object({
    name               = string
    policy             = optional(string, "")
    acl                = optional(string, "private")
    versioning_status  = optional(string, "Enabled")
    notify_eventbridge = optional(bool, false)
    lifecycle = optional(object({
      name            = string
      prefix          = string
      expiration_days = number
    }), null)
  })
}

variable "objects" {
  type = list(object({
    key    = string
    source = string
  }))
  default = []
}
