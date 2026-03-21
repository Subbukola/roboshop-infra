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

variable "rabitmq_tags" {

    default = {}
  
}



variable "policy" {
    default = "arn:aws:iam::aws:policy/AdministratorAccess"
  
}
variable "iam_role" {
    default = {}
  
}
