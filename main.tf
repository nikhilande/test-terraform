provider "aws" {
  region = "us-east-1"
}
locals {
  name = "${var.env}-ecs-demo"
}

module "vpc" {
  source = "./modules/vpc"

}

module "alb" {
  source = "./modules/alb"

  name           = local.name
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "rds" {
  source = "./modules/rds"

  create         = var.create_rds
  instance_class = var.instance_class
  vpc_id         = module.vpc.vpc_id
}

module "ecs" {
  source = "./modules/ecs"

  name             = local.name
  vpc_id           = module.vpc.vpc_id
  subnets          = module.vpc.public_subnets
  desired_count    = var.desired_count
  target_group_arn = module.alb.tg_arn
  alb_sg_id        = module.alb.alb_sg_id
}