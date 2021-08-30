resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

# resource "aws_iam_role_policy" "ec2_policy" {
#   name = "ec2_policy"
#   role = aws_iam_role.ec2_role.id

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   policy = jsonencode(
#       {
#     "Version": "2012-10-17",
#     "Id": "Policy1629693900389",
#     "Statement": [
#         {
#             "Sid": "Stmt1629693899292",
#             "Effect": "Allow",
#             "Principal": "*",
#             "Action": "s3:*",
#             "Resource": "arn:aws:s3:::demo-project-bucket/*"
#         },
#         {
#             "Effect": "Allow",
#             "Action": "s3.ListAllMyBuckets",
#             "Resource":"arn:aws:s3:::*"
#         }
#     ]
# })
# }
resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = jsonencode(
      {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
  )
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.ec2_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}