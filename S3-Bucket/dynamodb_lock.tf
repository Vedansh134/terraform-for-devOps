# # Create dynamodb table for locking
# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "terraform-state-locks"
#   billing_mode = "PAY_PER_REQUEST" # Cheap for low usage
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S" # String type
#   }

#   tags = {
#     Name = "Terraform State Lock Table"
#     env  = "test"
#   }
# }