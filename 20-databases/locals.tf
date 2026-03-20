locals {
  database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
    database_sg_id = data.aws_ssm_parameter.database_sg_id.value
    common_tags={
    project=var.project
    environment= var.environment
    terraform= "true"
  }

}