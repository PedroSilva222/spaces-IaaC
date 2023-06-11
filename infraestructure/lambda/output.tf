output "lambda_arn" {
  value = module.lambda_geolocation.lambda_arn
  description = "Export Lambda arn"
}