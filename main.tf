module "consul" {
source = "https://github.com/Gunamoni11/to-terrafom.git"
}

resource "aws_instance" "this" {
  count = var.create && !var.create_spot_instance ? 1 : 0

  ami                  = var.ami
  instance_type        = var.instance_type
  user_data            = var.user_data
  
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  key_name             = var.key_name
 
 }
