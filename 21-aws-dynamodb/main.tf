resource "aws_dynamodb_table" "cars" {
    name = "cars"
    hash_key = "VIN"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
        name = "VIN"
        type = "S"
    }
}