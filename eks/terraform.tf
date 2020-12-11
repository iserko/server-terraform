provider "aws" {
  version = "~> 3.0.0"
  region  = var.aws_region
  profile = var.aws_profile != "" ? var.aws_profile : null
}

terraform {
  backend "s3" {
    bucket = "${var.basename}-terraform-state"
    key    = "terraform.tfstate"
    region = var.aws_region
  }
}
