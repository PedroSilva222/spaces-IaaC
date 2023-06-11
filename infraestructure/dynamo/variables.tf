variable "region" {
  description = "AWS Region name"
  default = "us-east-1"
  type = string
}

variable "bucket_name" {
  description = "User Bucket to upload logo image from profile"
  type = string
}

variable "bucket_name_community" {
  description = "Community Bucket to upload logo image from profile"
  type = string
}

variable "team" {
  description = "The name of the team"
  default = "DevOps"
  type = string
}

variable "project" {
  description = "The name of the project"
  default = "Terraform"
  type = string
}

variable "created_by" {
  description = "Resources created by"
  default = "PedroSpiet"
  type = string
}

variable "organization" {
  description = "The name of the organization"
  default = "terraform"
  type = string
}
