locals {
  sg_id_parameter="/${var.project}/${var.environment}-sg_id"
  vpc_id=data.aws_ssm_parameter.vpc_id.value
}









































# locals {
#  # vpc_id_parameter="/${var.project}-/${var.environment}-vpc_id"

#  vpc_id=data.aws_ssm_parameter.vpc_id.value  
# }