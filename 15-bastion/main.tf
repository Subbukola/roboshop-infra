resource "aws_instance" "bastion" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  vpc_security_group_ids=[local.bastion_sg_id]
  subnet_id = local.public_subnet_id
  iam_instance_profile = aws_iam_instance_profile.bastion.name

  root_block_device {
    volume_size = 50             # Customize volume size to 50 GB
    volume_type = "gp3"          # Change volume type
    delete_on_termination = true # Default is true, but shown for clarity
    tags = {
      Name = "bastion-volume"
    }
  }

  tags = merge(
    local.common_tags,
    var.bastion_tags,
    {
        Name="${var.project}-${var.environment}-bastion"
    }
  )
}

#IAM role
resource "aws_iam_role" "bastion" {
  name = "roboshop_bastion"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    var.iam_role,
    local.common_tags,
    {
      Name="roboshop_bastion"
    }
  )
}


#  Attach the policy to the role 
resource "aws_iam_role_policy_attachment" "bastion" {
  role       = aws_iam_role.bastion.name
  #policy_arn = aws_iam_policy.example_policy.arn
  policy_arn = var.policy
}

# Create the instance profile
resource "aws_iam_instance_profile" "bastion" {
  name = "${var.project}-${var.environment}-bastion"
  role = aws_iam_role.bastion.name
}