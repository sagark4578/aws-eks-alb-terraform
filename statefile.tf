###################################### Dev  ####################################################
terraform {
  backend "s3" {}
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = "vpc/vpc-state.tfstate"
    region = var.remote_state_region
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = "eks/eks-state.tfstate"
    region = var.remote_state_region
  }
}

data "terraform_remote_state" "route53" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = "route53/route53-state.tfstate"
    region = var.remote_state_region
  }
}
