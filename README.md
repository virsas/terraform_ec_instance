# terraform_ec_instance

Terraform module to create Elastic Cache instance

##  Dependencies

- EC Subnet - <https://github.com/virsas/terraform_ec_subnet>
- VPC Security groups - <https://github.com/virsas/terraform_vpc_sg>

## Files

- None

## Terraform example

``` terraform
##############
# Variable
##############
variable "ec_redis_chat" {
  default = {
    name = "redisChat"
    parameter_group = "default.redis5.0"
    engine = "redis"
    version = "5.0.6"
    maintenance = "sun:03:00-sun:04:00"
    instance = "cache.t3.micro"
    count = "1"
    port = "6379"
    zone = "eu-west-1a"
  }
}

##############
# Module
##############
module "ec_redis_chat" {
  source = "github.com/virsas/terraform_ec_instance"
  instance = var.ec_redis_chat
  security_groups = [ module.vpc_sg_admin.id, module.vpc_sg_ec.id ]
  subnet = module.ec_subnet_default.name
}
```

## Outputs

- arn