output "url" {
    description = "url for task definition"
    value ="${var.ecr_repository_url}:${var.image_tag}"
}
output "db_pass" {
  value = aws_ssm_parameter.db_pass.value
  sensitive = true
}

output "token"{
    value = aws_ssm_parameter.token.arn
    
}

output "api_key"{
    value = aws_ssm_parameter.api_key.arn
    
}
