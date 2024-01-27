terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}

resource "aws_s3_bucket" "backend-bucket" {
  bucket = "remote-backendforterra"
}

resource "aws_dynamodb_table" "backend-table" {
  name         = "remote-backend-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LOCKID"

  attribute {
    name = "LOCKID"
    type = "S"
  }
}

ubuntu@ip-172-31-1-80:~/terraform-backend$ vim backend_terra.tf 
ubuntu@ip-172-31-1-80:~/terraform-backend$ terraform apply
╷
│ Error: Retrieving AWS account details: validating provider credentials: retrieving caller identity from STS: operation error STS: GetCallerIdentity, https response error StatusCode: 403, RequestID: f42d6dfd-ad70-4750-8764-5b359ee9c783, api error InvalidClientTokenId: The security token included in the request is invalid.
│ 
│   with provider["registry.terraform.io/hashicorp/aws"],
│   on backend_terra.tf line 10, in provider "aws":
│   10: provider "aws" {
│ 
╵
ubuntu@ip-172-31-1-80:~/terraform-backend$ aws sts get-caller-identity

An error occurred (InvalidClientTokenId) when calling the GetCallerIdentity operation: The security token included in the request is invalid.
ubuntu@ip-172-31-1-80:~/terraform-backend$ 
ubuntu@ip-172-31-1-80:~/terraform-backend$ cat backend_terra.tf 
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}

resource "aws_s3_bucket" "backend-bucket" {
  bucket = "remote-backendforterra"
}

resource "aws_dynamodb_table" "backend-table" {
  name         = "remote-backend-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LOCKID"

  attribute {
    name = "LOCKID"
    type = "S"
  }
}
