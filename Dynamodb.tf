# Specify the provider
provider "aws" {
  region = "eu-north-1"  # Change the region as per your requirement
}

# Define DynamoDB table
resource "aws_dynamodb_table" "my_table" {
  name         = "GuestBookOne"
  billing_mode = "PROVISIONED"  # Could also be PAY_PER_REQUEST

  hash_key     = "id"  # Partition key
  range_key    = "date" # Sort key (optional)

  attribute {
    name = "id"
    type = "S"  # String type
  }

  attribute {
    name = "date"
    type = "S"  # String type
  }

  
   

  read_capacity  = 5  # Adjust capacity as per your needs
  write_capacity = 5

  tags = {
    Name        = "GuestBookOne"
    Environment = "Dev"
  }
}

# Add dummy data (optional)
resource "aws_dynamodb_table_item" "my_item" {
  table_name = aws_dynamodb_table.my_table.name

  hash_key = aws_dynamodb_table.my_table.hash_key
  range_key = aws_dynamodb_table.my_table.range_key

  item = <<ITEM
  {
    "id": {"S": "1"},
    "date": {"S": "2024-08-15"},
    "name": {"S": "Godwin Dorglo"},
    "email": {"S": "godwins9001@gmai.com"},
     "country": {"S": "Ghana"}
  }
  ITEM
}
