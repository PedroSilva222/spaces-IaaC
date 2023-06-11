########################################
# Common Tags for Upload bucket and SQS
########################################
locals {
  common_tags = {
    team                  = var.team
    project               = var.project
    created_by            = var.created_by
    organization          = var.organization
  }
}