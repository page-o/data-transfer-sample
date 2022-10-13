locals {
  env                  = "sample"
  project              = "example"
  credential_file_path = var.credential_file_path
  gcp_project_id       = var.gcp_project_id
  access_key_id        = var.access_key_id
  secret_access_key    = var.secret_access_key

  object_key = {
    hoge = "hoge.parquet"
    fuga = "fuga.parquet"
  }
  object_source = {
    hoge = "../../templates/bucket/hoge.parquet"
    fuga = "../../templates/bucket/fuga.parquet"
  }
  transfer_schedule = "every day 15:00" # UTC (0:00 Tokyo)
}
