provider "google" {
  credentials = file(var.credential_file_path)
  project     = var.gcp_project_id
  region      = var.gcp_region
}

resource "google_bigquery_dataset" "main" {
  dataset_id    = var.dataset.name
  friendly_name = var.dataset.name
  description   = var.dataset.description
  location      = var.gcp_region
}

resource "google_bigquery_table" "main" {
  count = length(var.tables)

  dataset_id          = google_bigquery_dataset.main.dataset_id
  table_id            = element(var.tables.*.name, count.index)
  friendly_name       = element(var.tables.*.name, count.index)
  description         = element(var.tables.*.description, count.index)
  deletion_protection = false
}

resource "google_bigquery_data_transfer_config" "main" {
  count = length(var.data_transfers)

  display_name           = element(var.data_transfers.*.name, count.index)
  location               = var.gcp_region
  data_source_id         = "amazon_s3"
  schedule               = var.transfer_schedule
  destination_dataset_id = google_bigquery_dataset.main.dataset_id
  params = {
    destination_table_name_template = element(var.data_transfers.*.table_name, count.index)
    data_path                       = element(var.data_transfers.*.data_path, count.index)
    access_key_id                   = var.access_key_id
    secret_access_key               = var.secret_access_key
    file_format                     = "PARQUET"
    write_disposition               = "WRITE_TRUNCATE"
    max_bad_records                 = 0
  }
  email_preferences {
    enable_failure_email = true
  }
}
