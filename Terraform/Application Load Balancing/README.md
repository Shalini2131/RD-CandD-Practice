# Path based routing using Application Load Balancer
## PreRequisites
### Running EC2 Instance with a server.
### Application Load Balancer
### Server used - nginx 
### Configuring server 
#### ```sudo su - ```
#### ```yum install nginx```
#### ```amazon-linux-extras install nginx.1.12```
#### ```systemctl status nginx```
#### ```systemctl start nginx```
#### change directory to /usr/share/nginx/html and create the html files that are used as target paths.
## Process steps:
### 1. Create an instance which is capable of running a server, suppose nginx
### 2. Create an Application Load balancer.
### 3. Create three target groups with type as instance and their respective paths as /red/ , /blue/ and /yellow/.
### 4. Now go to the load balancer and add listener rules by adding the path headers and forwarding it to respective target group.
### 5. You can give a fixed response for the default rule by adding some plain text with response code as 200.
### 6. Register the running instance to all the target groups that are associated with the created ALB.
### 7. Once everything is set, you can open the ALB domain url and check whether the path based routing is working or not.
### 8. If there is any issue, check the listener rules thorougly.
## Terraform steps
### ```terraform init``` -- This command is used to initialize the working directory containing Terraform configuration files  and installs the plugins.
### ```terraform plan``` -- After a successful initialization of the working directory and the completion of the plugin download, we can create an execution plan using terraform plan ### command, this is a handy way to check whether the execution plan matches your expectations without making any changes to real resources or to the state.
### If the Terraform discovers no changes to resources, then the terraform plan indicates that no changes are required to the real infrastructure.
### ```terraform apply``` --Terraform apply command is used to create or introduce changes to real infrastructure. By default, apply scans the current working directory for the ### configuration and applies the changes appropriately. However, you’ll optionally give the path to a saved plan file that was previously created with terraform plan.
### If you do not provides a plan file on the instruction, terraform apply will create a replacement plan automatically then prompt for approval to use it. If the created plan  ### does not include any changes to resources or to root module output values then terraform apply will exit immediately, without prompting.
### ```terraform destroy``` -- this is used to destroy all your created infrastructure.
