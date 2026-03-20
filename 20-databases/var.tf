variable "project" {
    default = "roboshop"
  
}

variable "environment" {
    default = "DEV"
  
}
variable "mongodb_tags" {
    default = {}
  
}

variable "policy" {
    default = "arn:aws:iam::aws:policy/AdministratorAccess"
  
}
variable "iam_role" {
    default = {}
  
}
