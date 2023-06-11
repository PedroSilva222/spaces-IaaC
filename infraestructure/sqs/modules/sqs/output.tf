output "queue_geolocation_url" {
  value = aws_sqs_queue.queue_geolocation.id
}

output "queue_geolocation_arn" {
  value = aws_sqs_queue.queue_geolocation.arn
}
output "deadletter_queue_url" {
  value = aws_sqs_queue.geolocation_queue_deadletter.id
}


output "consumer_policy_arn" {
  value = aws_iam_policy.consumer_policy.arn
}


output "producer_policy_arn" {
  value = aws_iam_policy.producer_policy.arn
}