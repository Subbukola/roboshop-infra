#internet to bastinint
resource "aws_security_group_rule" "bastin_sg_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  #source_security_group_id=""
  security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
}

#bastinint to mongodb
resource "aws_security_group_rule" "bastion_mongodb" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
}


#bastinint to redis
resource "aws_security_group_rule" "bastion_redis" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.redis_sg_id.value
}


#bastinint to mysql
resource "aws_security_group_rule" "bastion_mysql" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
}


#bastinint to rabbitmq
resource "aws_security_group_rule" "bastion_rabbitmq" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
}

#------------------BACKEND(catalogue, user, cart, shipping, payment)------------------------------------
#bastinint to catalogue
 resource "aws_security_group_rule" "bastion_catalogue" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
} 

#bastinint to user
 resource "aws_security_group_rule" "bastion_user" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.user_sg_id.value
} 

#bastinint to cart
 resource "aws_security_group_rule" "bastion_cart" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.cart_sg_id.value
} 

#bastinint to shipping
 resource "aws_security_group_rule" "bastion_shipping" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
} 

#bastinint to payment
 resource "aws_security_group_rule" "bastion_payment" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.payment_sg_id.value
} 

  
 #bastinint to payment
 resource "aws_security_group_rule" "bastion_Backend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
} 


 #bastinint to frontend
 resource "aws_security_group_rule" "bastion_frontend" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
} 

   #bastinint to frontend_alb
 resource "aws_security_group_rule" "bastion_frontend_alb" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = "[0.0.0.0/0]"
  source_security_group_id=data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
} 
      
    
        