# Custom VPC creation in Terraform
## Requirements
### -> 2 public subnets
### -> 2 private subnets
### -> 2 EC2 instances (1 public and the other private)
### Files and their contents:
#### - sg.tf contains the security group rules, here allowing ssh from anywhere
#### - aws.tf contains the creation of instances and the provider details.
#### - associations.tf contains the associations between the route tables.
#### - vpc.tf contains the creation of resources like vpc, subnets, internet gateway
#### - outputs.tf contains the outputs of the resources to be displayed after creation.
