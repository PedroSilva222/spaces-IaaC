##
## Main configuration: creates several SQS queues using a module, then
## combines their policies into an application role.
##

module "notifications_queue" {
  source = "./modules/sqs"
  queue_name = var.sqs_name
  common_tags = var.common_tags
  sqs_delay_sec = var.sqs_delay_sec
  sqs_max_message_size = var.sqs_max_message_size
  sqs_name = var.sqs_name
  sqs_receive_wait_time = var.sqs_receive_wait_time
  sqs_retention_period = var.sqs_retention_period
}
