variable "project" {
    default = "roboshop"
  
}

variable "environment" {
    default = "DEV"
  
}
variable "mongodb_tags" {
    default = {}
  
}
variable "redis_tags" {

    default = {}
  
}

variable "mysql_tags" {

    default = {}
  
}

variable "rabbitmq_tags" {

    default = {}
  
}



variable "policy" {
    default = "arn:aws:iam::aws:policy/AdministratorAccess"
  
}
variable "iam_role" {
    default = {}
  
}

variable "zone_id" {
    default = "Z10262718FD0B5C9MRAM"
  
}

variable "domain_name"{
    default = "kola88.online"
}