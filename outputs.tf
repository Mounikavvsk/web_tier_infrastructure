output "web_url" {
  value = "http://${module.load_balancer.alb_dns_name}"
}
