variable "bucket_name" {
  description = "The name of the bucket."
  type = string
}

variable "bucket_name_community" {
  description = "The name of the bucket."
  type = string
}

variable "common_tags" {
  description = "common tags for resource"
  type = map(string)
}
