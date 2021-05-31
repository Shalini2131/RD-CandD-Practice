# Path based routing using Application Load Balancer
## PreRequisites
### Running EC2 Instance with a server.
### Application Load Balancer
### Server used - nginx 
### Configuring server 
#### sudo su -
#### yum install nginx
#### amazon-linux-extras install nginx.1.12
#### systemctl status nginx
#### systemctl start nginx
#### change directory to /usr/share/nginx/html and create the html files that are used as target paths.