# Static website hosting using S3 bucket and Cloudfront distribution in cloudformation

#### 1. Created a S3 bucket and added 2 objects of type "html" which are located in the "html/" folder
#### 2. Removed "blocking all public access"
#### 3. Added bucket policy, to get all the objects of S3 bucket can be accessible.
#### 4. And then created a cloudfront distribution with the default root object as index..html.
#### 5.Changed the protocol as redirect-to-https for secure connection. 
#### 6. Set the origin configurations to S3 bucket references, to access the bucket using cloudfront url.
### Finally, after successful creation, we can access the S3 objects using cloudfront domain.
