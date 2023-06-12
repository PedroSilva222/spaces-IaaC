

##
## The primary and dead-letter queues
##
resource "aws_sqs_queue" "queue_geolocation" {
  name                      = "${var.sqs_name}-${terraform.workspace}"
  delay_seconds             = var.sqs_delay_sec
  max_message_size          = var.sqs_max_message_size
  message_retention_seconds = var.sqs_retention_period
  receive_wait_time_seconds = var.sqs_receive_wait_time
  redrive_policy            = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.geolocation_queue_deadletter.arn}\",\"maxReceiveCount\":4}"
  tags = merge(
    var.common_tags,
    {
      Name = "${var.sqs_name}"
    }
  )
}

resource "aws_sqs_queue" "geolocation_queue_deadletter" {
  name = "geolocation-deadletter-queue"
  message_retention_seconds = var.sqs_retention_period
  receive_wait_time_seconds = var.sqs_receive_wait_time
}

##
## Managed policies that allow access to the queue
##

resource "aws_iam_policy" "consumer_policy" {
  name        = "SQS-${var.sqs_name_policy}-consumer_policy"
  description = "Attach this policy to consumers of ${var.sqs_name_policy} SQS queue"
  policy      = data.aws_iam_policy_document.consumer_policy.json
}

data "aws_iam_policy_document" "consumer_policy" {
  statement {
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:ChangeMessageVisibilityBatch",
      "sqs:DeleteMessage",
      "sqs:DeleteMessageBatch",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.queue_geolocation.arn,
      aws_sqs_queue.geolocation_queue_deadletter.arn
    ]
  }
}

resource "aws_iam_policy" "producer_policy" {
  name        = "SQS-${var.sqs_name_policy}-producer"
  description = "Attach this policy to producers for ${var.sqs_name_policy} SQS queue"
  policy      = data.aws_iam_policy_document.producer_policy.json
}

data "aws_iam_policy_document" "producer_policy" {
  statement {
    actions = [
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:SendMessage",
      "sqs:SendMessageBatch"
    ]
    resources = [
      aws_sqs_queue.queue_geolocation.arn
    ]
  }
}