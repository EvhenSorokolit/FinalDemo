resource "aws_ssm_parameter" "db_pass" {
  name        = "/${var.name}/${var.env}/database/password/master"
  description = "The parameter description"
  type        = "SecureString"
  value       = var.db_pass
  overwrite =true
}

resource "aws_ssm_parameter" "token" {
  name        = "/${var.name}/${var.env}/telegramtoken"
  description = "The parameter description"
  type        = "SecureString"
  value       = var.token
  overwrite =true
}

resource "aws_ssm_parameter" "api_key" {
  name        = "/${var.name}/${var.env}/tmdbtoken"
  description = "The parameter description"
  type        = "SecureString"
  value       = var.api_key
  overwrite =true
}


