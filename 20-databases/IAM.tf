#IAM role
resource "aws_iam_role" "mysql" {
  name = local.mysql_role_name

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
    local.common_tags,
    {
     name = local.mysql_role_name
    }
  )
}


 #creating policy for myswl
resource "aws_iam_policy" "s3_read_policy" {
  name        = local.mysql_policy_name
  description = "Grants read and get permissionf for ssm parameter store"
  policy      =file("mysql-iam-policy.json")
}

#  Attach the policy to the role 
resource "aws_iam_role_policy_attachment" "mysql" {
  role       = aws_iam_role.mysql.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
  
}

# Create the instance profile
resource "aws_iam_instance_profile" "mysql" {
  name = "${var.project}-${var.environment}-mysql"
  role = aws_iam_role.mysql.name
} 