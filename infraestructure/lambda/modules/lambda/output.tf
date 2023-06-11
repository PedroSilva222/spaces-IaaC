output "lambda_arn" {
  value = aws_lambda_function.geoloc_update_lambda.arn
  description = "Export Lambda arn"
}