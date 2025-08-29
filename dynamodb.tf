resource "aws_dynamodb_table" "dynamodb-table" {
  name         = "my-terraform-infra-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "my-terraform-infra-table"
  }
}
