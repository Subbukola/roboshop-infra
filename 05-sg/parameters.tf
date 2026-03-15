resource "aws_ssm_parameter" "sg_id" {
  count = length(var.sg_names)
  #name  = local.sg_id_parameter
  name="/${var.project}/${var.environment}/${var.sg_names[count.index]}_sg_id"
  type  = "String"
  value = module.sg_call[count.index].security_group_id
}


































































































# resource "aws_ssm_parameter" "sg_id" {
#   name  = "/${var.project}/${var.environment}/${var.sg_names[count.index]}_vpc_id"
#   type  = "String"
#   value = module.sg_call[count.index].sg_id
# }