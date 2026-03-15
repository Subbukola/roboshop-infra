resource "aws_instance" "bastion" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  vpc_security_group_ids=[local.bastion_sg_id]
  subnet_id = local.public_subnet_id

  tags = merge(
    local.common_tags,
    var.bastion_tags,
    {
        Name="${var.project}-${var.environment}-bastion"
    }
  )
}