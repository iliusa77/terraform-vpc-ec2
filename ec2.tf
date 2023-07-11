resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCU2N5a5w5YskU5H9O2vwmObqKcV7x6NVGVhxUJ7g1AiBexMphyzoARTkxCKuoNHfMRGwOm4wlBe0X84FMGC65tYZatuL6utvCm781ObLW3e0p2Y0vQyposj0/ZGDxrq25FSI2/Ra7ZWiU01SBkyYp1kg1IVb523pRpuzMks+K8k/KQR+nzFqkrX3B1ypcYiE4EOKyZQYcSClOqSUhKosIALqVTODAJece0SeUMDq0X9k85HLTbMiYQbOM4d/F6G3UBP4fVJHYD8iBKtIUFxPXc4vzxA2VqqrQst7V2ggGPBkAduAqO1ig8vJmFbyv69i/srg2OlXIczLxdsjWGlZmeOoe1U+Agas2nErIgMQJ6hxCUbdNjcImZPyf7CQruEcNeX2J46/E1ZoyBxW/XmWrcDSa7mwxO8dIKn8sgE1pn2cAu2QYb7+vWjPcDNZu1YeMDlKWKMJtMBzGjKbWF+FZdNjoT7Qmk/+8McQcLHA5Ap65TRKFfhialgYs78E+iAH8= vagrant@ubuntu-focal"
}

resource "aws_instance" "server" {
  ami                     = "ami-0b2d569b854fcf192" #Ubuntu 20.04
  instance_type           = "t2.micro"
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