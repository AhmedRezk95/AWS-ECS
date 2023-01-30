terraform {
  backend "s3" {
    bucket         = "rizk-statefile"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "rizk"
  }
}
