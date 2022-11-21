terraform {
  required_version = "1.2.1"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = local.aws_profile
}

module "vpc" {
  source        = "./modules/vpc"
  environment   = var.environment
  project       = local.project
  aws_region    = var.aws_region
  subnet_counts = var.subnet_counts
}

module "wiki" {
  source              = "./modules/wiki"
  environment         = var.environment
  project             = local.project
  aws_region          = var.aws_region
  aws_vpc_vpc_id      = module.vpc.aws_vpc_vpc_id
  instance_type       = local.instance_type
  db_instance_type    = local.db_instance_type
  amis                = var.amis
  public-subnet-ids   = module.vpc.public-subnet-ids
  private-subnet-ids  = module.vpc.private-subnet-ids
  internal_ip_ssh     = local.internal_ip_ssh
  key_name            = var.key_name
  sns_topic_arn       = "aws_sns_topic.futura-events.arn"
  avaiable_zones_name = module.vpc.avaiable_zones_name

  # depends_on = [module.vpc, aws_sns_topic.futura-events]
  depends_on = [module.vpc]
}