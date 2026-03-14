module "sg_call" {
    #source = "git::https://github.com/Subbukola/aws_vpc_module.git?ref=main"
    count = length(var.sg_names)
    source = "../../aws_sg_module"
    project=var.project
    environment=var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = replace(var.sg_names[count.index],"_","-")
  
}