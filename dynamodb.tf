resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "UserId"
  range_key = "RolNo"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "RolNo"
    type = "N"
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
