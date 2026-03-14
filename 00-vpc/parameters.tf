resource "aws_ssm_parameter" "vpc_id" {
  name  = local.vpc_id_parameter
  type  = "StringList"
  value = module.vpc_call.my_vpc_id
}


#subets ID

resource "aws_ssm_parameter" "public_subnet__ids" {
  name  = "/${var.project}/${var.environment}/public_subnet_ids"
  type  = "StringList"
  value = join(",",module.vpc_call.public_subnet_ids)
}

resource "aws_ssm_parameter" "private_subnet__ids" {
  name  = "/${var.project}/${var.environment}/private_subnet_ids"
  type  = "StringList"
  value = join(",",module.vpc_call.private_subnet_ids)
}

resource "aws_ssm_parameter" "database_subnet__ids" {
  name  = "/${var.project}/${var.environment}/database_subnet_ids"
  type  = "StringList"
  value = join(",",module.vpc_call.database_subnet_ids)
}
