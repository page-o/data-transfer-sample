module "bucket" {
  source = "../../shared/modules/s3"

  bucket = {
    name = "${local.env}-${local.project}-bucket"
  }
  objects = [
    {
      key    = local.object_key.hoge
      source = local.object_source.hoge
    },
    {
      key    = local.object_key.fuga
      source = local.object_source.fuga
    }
  ]
}

module "dts" {
  source = "../../shared/modules/dts"

  credential_file_path = sensitive(local.credential_file_path)
  gcp_project_id       = sensitive(local.gcp_project_id)
  access_key_id        = sensitive(local.access_key_id)
  secret_access_key    = sensitive(local.secret_access_key)
  dataset = {
    name        = "${local.env}-${local.project}-dataset"
    description = "${local.env} ${local.project} Dataset"
  }
  tables = [
    {
      name        = "hoge"
      description = "hoge table"
    },
    {
      name        = "fuga"
      description = "fuga table"
    }
  ]
  data_transfers = [
    {
      name       = "hoge-dts"
      table_name = "hoge"
      data_path  = "s3://${module.bucket.name}/${local.object_key.hoge}"
    },
    {
      name       = "fuga-dts"
      table_name = "fuga"
      data_path  = "s3://${module.bucket.name}/${local.object_key.fuga}"
    }
  ]
  transfer_schedule = local.transfer_schedule
}
