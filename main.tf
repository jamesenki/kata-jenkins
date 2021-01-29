provider "aws" { 
  region= var.region
  access_key= var.deployment_username
  secret_key = var.deployment_password
 }

resource "aws_s3_bucket" "terraform_state"{
    bucket = "automate-all-the-things-terraform-state-james-cloud"
    
    versioning {
      enabled = true  
    }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_state_locks" {
  name = "automate-all-the-things-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}