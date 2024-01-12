# Required AWS CLI configuration properties
variable "aws_region" {
  default = "us-east-1"
}

variable "awscli_config" {
  default = "/Users/uzunogeo/.aws/config"
}

variable "awscli_credentials" {
  default = "/Users/uzunogeo/.aws/credentials"
}

# AWS Resources configuration properties
variable "instance_type" {
  default = "t2.micro"
}

# AWS RDS configuration properties
variable "db_instance_class" {
  default = "db.t2.micro"
}

variable "db_identifier" {
  default = "web-app-db"
}

variable "db_name" {
  default = "mywebapp"
}

variable "db_engine" {
  default = "mysql"
}

variable "db_engine_version" {
  default = "8.0.28"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "admin_123"
}