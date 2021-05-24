# Custom VPC creation in Terraform
## Requirements
### -> 2 public subnets
### -> 2 private subnets
### -> 2 EC2 instances (1 public and the other private)
### Files and their contents:
#### 1. sg.tf contains the security group rules, here allowing ssh from anywhere
#### 2. aws.tf contains the creation of instances and the provider details.
#### 3. associations.tf contains the associations between the route tables.
#### 4. vpc.tf contains the creation of resources like vpc, subnets, internet gateway
#### 5. outputs.tf contains the outputs of the resources to be displayed after creation.
