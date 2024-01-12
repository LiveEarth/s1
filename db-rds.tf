# Provides an RDS instance resource
resource "aws_db_instance" "db-server" {
  instance_class              = var.db_instance_class
  allocated_storage           = 20 # in GB
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = true
  backup_retention_period     = 0
  identifier                  = var.db_identifier
  db_name                     = var.db_name
  engine                      = var.db_engine
  engine_version              = var.db_engine_version
  username                    = var.db_username
  password                    = var.db_password
  monitoring_interval         = 0
  multi_az                    = false
  port                        = 3306
  publicly_accessible         = false
  skip_final_snapshot         = true
}