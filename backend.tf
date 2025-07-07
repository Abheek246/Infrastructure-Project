 terraform   {
    backend "s3" {
        bucket = "abheek-bucket"
        region = "us-east-1"
        key = "main"
        dynamodb_table = "my-dynamodb-table"

    }
}