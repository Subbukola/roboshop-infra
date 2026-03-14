variable "project" {
    default = "roboshop"
  
}

variable "environment" {
    default = "DEV"
  
}

variable "sg_names" {
    type = list
    default = [
        # Databases
        "mongodb", "redis", "mysql", "rabbitmq",
        # Backend
        "catalogue", "user", "cart", "shipping", "payment",
        # Backend ALB
        "backend_alb",
        # Frontend
        "frontend",
        # Frontend ALB
        "frontend_alb",
        # Bastion
        "bastion"
    ]
}



















# variable "project" {
#     default = "roboshop"

  
# }

# variable "environment" {
#     default = "DEV"
  
# }


# variable "sg_names" {
#     type = list
#     default = [
#         # Databases
#         "mongodb", "redis", "mysql", "rabbitmq",
#         # Backend
#         "catalogue", "user", "cart", "shipping", "payment",
#         # Backend ALB
#         "backend_alb",
#         # Frontend
#         "frontend",
#         # Frontend ALB
#         "frontend_alb",
#         # Bastion
#         "bastion"
#     ]
# }