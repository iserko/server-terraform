provider "aws" {
  version = "~> 3.0.0"
  region  = var.aws_region
}

data "terraform_remote_state" "state" {
  backend = "s3"
  config = {
    bucket = "${var.basename}-terraform-state"
    key    = "terraform.tfstate"
    region = var.aws_region
  }
}
