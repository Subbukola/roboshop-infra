module "vpc_call" {
    source = "git::https://github.com/Subbukola/aws_vpc_module.git?ref=main"
    project=var.project
    env=var.environment
  
}