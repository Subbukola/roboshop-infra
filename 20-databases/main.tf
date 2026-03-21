#mongoDB

resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  vpc_security_group_ids=[local.mongodb_sg_id]
  subnet_id = local.database_subnet_id
  #iam_instance_profile = aws_iam_instance_profile.bastion.name

  tags = merge(
    local.common_tags,
    var.mongodb_tags,
    {
        Name="${var.project}-${var.environment}-mongodb"
    }
  )
}


 #used to connect to instance
resource "terraform_data" "bootstrap" {
  triggers_replace = [
    aws_instance.mongodb.id
  ]
  connection {
    type        = "ssh"
    host        = aws_instance.mongodb.private_ip
    user        = "ec2-user"
    password  = "DevOps321"
    
  }

  provisioner "file" {
    source      = "bootstap.sh"
    destination = "/tmp/bootstap.sh"
  }

  provisioner "remote-exec" {
    inline= [
      "chmod +x /tmp/bootstap.sh",
      "sudo sh /tmp/bootstap.sh mongodb ${var.environment}"
    
    ]
    
  }
} 



#redis

resource "aws_instance" "redis" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  vpc_security_group_ids=[local.redis_sg_id]
  subnet_id = local.database_subnet_id
  #iam_instance_profile = aws_iam_instance_profile.bastion.name

  tags = merge(
    local.common_tags,
    var.redis_tags,
    {
        Name="${var.project}-${var.environment}-redis"
    }
  )
}


 #used to connect to instance
resource "terraform_data" "redis_bootstrap" {
  triggers_replace = [
    aws_instance.redis.id
  ]
  connection {
    type        = "ssh"
    host        = aws_instance.redis.private_ip
    user        = "ec2-user"
    password  = "DevOps321"
    
  }

  provisioner "file" {
    source      = "bootstap.sh"
    destination = "/tmp/bootstap.sh"
  }

  provisioner "remote-exec" {
    inline= [
      "chmod +x /tmp/bootstap.sh",
      "sudo sh /tmp/bootstap.sh redis ${var.environment}"
    
    ]
    
  }
} 



#mysql

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  vpc_security_group_ids=[local.mysql_sg_id]
  subnet_id = local.database_subnet_id
  iam_instance_profile = aws_iam_instance_profile.bastion.name

  tags = merge(
    local.common_tags,
    var.mysql_tags,
    {
        Name="${var.project}-${var.environment}-mysql"
    }
  )
}


 #used to connect to instance
resource "terraform_data" "mysql_bootstrap" {
  triggers_replace = [
    aws_instance.mysql.id
  ]
  connection {
    type        = "ssh"
    host        = aws_instance.mysql.private_ip
    user        = "ec2-user"
    password  = "DevOps321"
    
  }

  provisioner "file" {
    source      = "bootstap.sh"
    destination = "/tmp/bootstap.sh"
  }

  provisioner "remote-exec" {
    inline= [
      "chmod +x /tmp/bootstap.sh",
      "sudo sh /tmp/bootstap.sh mysql ${var.environment}"
    
    ]
    
  }
} 



#rabitmq

resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  vpc_security_group_ids=[local.rabbitmq_sg_id]
  subnet_id = local.database_subnet_id
  #iam_instance_profile = aws_iam_instance_profile.bastion.name

  tags = merge(
    local.common_tags,
    var.rabbitmq_tags,
    {
        Name="${var.project}-${var.environment}-rabbitmq"
    }
  )
}


 #used to connect to instance
resource "terraform_data" "rabbitmq_bootstrap" {
  triggers_replace = [
    aws_instance.rabbitmq.id
  ]
  connection {
    type        = "ssh"
    host        = aws_instance.rabbitmq.private_ip
    user        = "ec2-user"
    password  = "DevOps321"
    
  }

  provisioner "file" {
    source      = "bootstap.sh"
    destination = "/tmp/bootstap.sh"
  }

  provisioner "remote-exec" {
    inline= [
      "chmod +x /tmp/bootstap.sh",
      "sudo sh /tmp/bootstap.sh rabbitmq ${var.environment}"
    
    ]
    
  }
}   