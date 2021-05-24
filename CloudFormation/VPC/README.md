# Custom VPC creation in Cloudformation
## Requirements
### -> 2 public subnets
### -> 2 private subnets
### -> 2 EC2 instances (1 public and the other private)
## Process steps:
#### 1. Created VPC.
#### 2. Created 4 subnets(2-public, 2-private).
#### 3. Created 2 route tables for public and private subnets and made associations to them.
#### 4. Created an Internet gateway for the public route to access the internet.
#### 5. Added security group, allowing ssh from anywhere.
#### 6. Finally, created the instances as per the requirements.
