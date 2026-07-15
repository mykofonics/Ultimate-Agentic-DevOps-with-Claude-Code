# Remote state backend configuration.
#
# Setup order:
#   1. Run `terraform init` with this block commented out (as below) and
#      `terraform apply` to create your resources, including a dedicated
#      S3 bucket you designate for storing Terraform state.
#   2. Uncomment the backend block below and fill in the bucket name
#      (and DynamoDB table, if you use one for state locking).
#   3. Run `terraform init -migrate-state` to migrate local state into
#      the S3 backend.
#
# terraform {
#   backend "s3" {
#     bucket         = "REPLACE_WITH_YOUR_STATE_BUCKET_NAME"
#     key            = "portfolio-site/terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "REPLACE_WITH_YOUR_LOCK_TABLE_NAME" # optional, for state locking
#   }
# }
