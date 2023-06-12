##
## Main configuration: creates several SQS queues using a module, then
## combines their policies into an application role.
##

module "geolocation_notification" {
  source = "./modules/sqs"
  common_tags = var.common_tags
  sqs_delay_sec = var.sqs_delay_sec
  sqs_max_message_size = var.sqs_max_message_size
  sqs_name = var.sqs_name
  sqs_receive_wait_time = var.sqs_receive_wait_time
  sqs_retention_period = var.sqs_retention_period
  sqs_name_policy = "sqs-geolocation-policy"
}

resource "aws_iam_role" "application_role" {
  name = "ApplicationRole"

  assume_role_policy = jsonencode({
    "Version"   = "2012-10-17",
    "Statement" = [
      {
        "Effect"    = "Allow"
        "Action"    = "sts:AssumeRole"
        "Principal" = { "Service" = "ec2.amazonaws.com" }
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "application_role_geoloc_producer" {
  role       = aws_iam_role.application_role.name
  policy_arn = module.geolocation_notification.producer_policy_arn
}

# Event source from SQS to Lambda Geolocation
resource "aws_lambda_event_source_mapping" "event_source_mapping_geolocation_queue" {
  event_source_arn = module.geolocation_notification.queue_geolocation_arn
  enabled          = true
  function_name    = "LambdaRetrieveGeolocation" // or arn
  batch_size       = 1
}