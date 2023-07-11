Define SSH public key in https://github.com/iliusa77/terraform-vpc-ec2/blob/main/ec2.tf#L3

### Terraform init/plan/apply
```
terraform init

terraform plan
var.profile
  AWS credentials profile you want to use
  Enter a value: default

terraform apply -auto-approve
```

### Terraform cleanup
```
terraform destroy -auto-approve
```

