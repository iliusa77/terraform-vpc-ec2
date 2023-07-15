resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key
}

resource "aws_instance" "server" {
  ami                     = var.ami #Ubuntu 20.04
  instance_type           = var.instance_type
  key_name                = "deployer-key"
  subnet_id               = module.vpc.public_subnets[0]
  vpc_security_group_ids = ["${module.vpc.default_security_group_id}"]
  associate_public_ip_address = true

  tags = {
    Name        = "server-ubuntu20.04"
    Environment = "dev"
  }

  depends_on = [
    module.vpc
  ]
}