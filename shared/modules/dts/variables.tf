variable "credential_file_path" {
  type = string
}

variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type    = string
  default = "asia-northeast1"
}

variable "access_key_id" {
  type = string
}

variable "secret_access_key" {
  type = string
}

variable "dataset" {
  type = object({
    name        = string
    description = string
  })
}

variable "tables" {
  type = list(object({
    name        = string
    description = string
  }))
}

variable "data_transfers" {
  type = list(object({
    name       = string
    table_name = string
    data_path  = string
  }))
}

variable "transfer_schedule" {
  type = string
}
