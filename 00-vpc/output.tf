output "my_vpc" {
    value = module.vpc_call.my_vpc_id
 
}

output "public_subnet_ids" {
    value = module.vpc_call.public_subnet_ids
  
}

output "private_subnet_ids" {
    value = module.vpc_call.private_subnet_ids
  
}

output "database_subnet_ids" {
    value = module.vpc_call.database_subnet_ids
  
}