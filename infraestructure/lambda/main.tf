module "lambda_geolocation" {
  source = "./modules/lambda"
  filename = var.filename
  function_name = var.function_name
  runtime = var.runtime
}

