provider "aws" {
  version = "~> 3.0"
  region  = var.aws_region
  profile = var.aws_profile != "" ? var.aws_profile : null
}

data "terraform_remote_state" "state" {
  backend = "s3"
  config = {
    bucket = "${var.basename}-terraform-state"
    key    = "terraform.tfstate"
    region = var.aws_region
  }
}
