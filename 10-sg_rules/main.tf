#internet to bastinint
resource "aws_security_group_rule" "bastin_sg_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  #source_security_group_id=""
  security_group_id = data.aws_ssm_parameter.bastion_sg_id.id
}

#bastinint to mongodb
resource "aws_security_group_rule" "mongodb_sg_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.id
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.id
}