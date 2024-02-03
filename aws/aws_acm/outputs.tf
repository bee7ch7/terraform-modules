output "acm_prime_arn" {
  description = "ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}

output "acm_prime_domain_names" {
  description = "Primary domain names"
  value       = module.acm.distinct_domain_names
}

output "validation_route53_record_fqdns" {
  description = "Validation records"
  value       = module.acm.validation_route53_record_fqdns
}

output "validation_domains" {
  description = "Validation domains"
  value       = module.acm.validation_domains
}
