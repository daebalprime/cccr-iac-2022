terraform {
  backend "s3" {
    bucket = "X"
    key    = "X"
    region = "ap-northeast-2"
    encrypt = true
    dynamodb_table = "terraform-lock"
  }
}
