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
      "sudo sh bootstrap.sh"
    
    ]
      

    
  }
} 