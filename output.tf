output "arn" {
  value = aws_elasticache_cluster.ec.arn
}
output "cache_nodes" {
  value = aws_elasticache_cluster.ec.cache_nodes
}