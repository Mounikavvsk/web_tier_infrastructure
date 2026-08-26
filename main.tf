module "vpc" {
  source = "./modules/01-vpc"
}

module "security_groups" {
  source = "./modules/02-security-groups"
  vpc_id = module.vpc.vpc_id
}

module "target_group" {
  source = "./modules/03-target-group"
  vpc_id = module.vpc.vpc_id
}

module "launch_template" {
  source                = "./modules/04-launch-template"
  web_security_group_id = module.security_groups.web_security_group_id
}

module "load_balancer" {
  source                = "./modules/05-load-balancer"
  alb_security_group_id = module.security_groups.alb_security_group_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  target_group_arn      = module.target_group.target_group_arn
}

module "asg" {
  source             = "./modules/06-asg"
  launch_template_id = module.launch_template.launch_template_id
  target_group_arn   = module.target_group.target_group_arn
  public_subnet_ids  = module.vpc.public_subnet_ids
}
