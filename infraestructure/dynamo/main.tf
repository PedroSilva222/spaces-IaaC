resource "aws_dynamodb_table" "preferences_telesccope_table" {
  name           = "UsersGeolocationTable"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "NameUser"
    type = "S"
  }

  attribute {
    name = "BirthdayDate"
    type = "S"
  }

  attribute {
    name = "DateTime"
    type = "S"
  }

  attribute {
    name = "Address"
    type = "S"
  }

  attribute {
    name = "Description"
    type = "S"
  }

  attribute {
    name = "MaxAge"
    type = "S"
  }

  attribute {
    name = "MinimumAge"
    type = "S"
  }

  attribute {
    name = "Zodiac"
    type = "S"
  }

  attribute {
    name = "Intention"
    type = "S"
  }

  attribute {
    name = "Disabled"
    type = "B"
  }

  attribute {
    name = "Gender"
    type = "S"
  }

  attribute {
    name = "PreferGender"
    type = "S"
  }

  attribute {
    name = "LocationLatitude"
    type = "N"
  }

  attribute {
    name = "LocationLongitude"
    type = "N"
  }


  global_secondary_index {
    name               = "GsiIndex"
    hash_key           = "UserId"
    write_capacity     = 5
    read_capacity      = 5
    projection_type    = "INCLUDE"
  }
}
