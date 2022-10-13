![Terraform](https://www.datocms-assets.com/2885/1620155113-brandhcterraformprimaryattributedcolor.svg)
# data-transfer-sample
Sample Terraform Code for Multi Cloud(AWS, GCP) Data Transfer System.

Creates the following resources:

- S3 Bcucket
- S3 Object
- BigQuery Dataset
- BigQuery Table
- Big Query Data Transfer Service

## Usage

Check the [sample](/sample/) folder.

Create terraform.tfvars in `/env/sample/` folder like below.
```tf: /env/sample/terraform.tfvars
credential_file_path = "credential.json"
gcp_project_id       = "gcp-project-id"
access_key_id        = "aws-iam-user-access-key-id"
secret_access_key    = "aws-iam-user-secret-access-key"
```


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 4.0 |
| google | >= 4.0 |

## LICENSE
[MIT](LICENSE)
