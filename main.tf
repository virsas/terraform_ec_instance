provider "aws" {
  region = var.region
}

resource "aws_elasticache_cluster" "ec" {
  cluster_id           = var.instance.name

  engine               = var.instance.engine
  engine_version       = var.instance.version

  maintenance_window   = var.instance.maintenance

  subnet_group_name = var.subnet
  security_group_ids = var.security_groups

  node_type            = var.instance.instance
  num_cache_nodes      = var.instance.count

  availability_zone    = var.instance.zone

  parameter_group_name = var.instance.parameter_group

  port                 = var.instance.port
}