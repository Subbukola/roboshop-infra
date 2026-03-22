#mongodb
resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "mongodb-${var.environment}-${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.mongodb.private_ip]
}


#redis
resource "aws_route53_record" "redis" {
  zone_id = var.zone_id
  name    = "redis-${var.environment}-${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.redis.private_ip]
}

#mysql
resource "aws_route53_record" "mysql" {
  zone_id = local.domain_zone_id.id
  name    = "mysql-${var.environment}-${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mysql.private_ip]
}

#rabbitmq
resource "aws_route53_record" "rabbitmq" {
  zone_id = local.domain_zone_id.id
  name    = "rabbitmq-${var.environment}-${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.rabbitmq.private_ip]
}