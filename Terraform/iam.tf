# Web App 

resource "aws_iam_instance_profile" "simple-web-app" {
  name = "simple-web-app"
  role = aws_iam_role.simple-web-app.name
}

resource "aws_iam_role" "simple-web-app" {
  name = "simple-web-app"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  managed_policy_arns = [aws_iam_policy.ecr-access.arn]
}

# Jenkins 

resource "aws_iam_instance_profile" "jenkins" {
  name = "jenkins"
  role = aws_iam_role.jenkins.name
}

resource "aws_iam_role" "jenkins" {
  name = "jenkins"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  managed_policy_arns = [ aws_iam_policy.ecr-access.arn,
                          aws_iam_policy.ec2-access.arn,
                          aws_iam_policy.s3-access.arn,
                          aws_iam_policy.secrets-access.arn]
}

# EC2

resource "aws_iam_policy" "ec2-access" {
  name = "ec2-access"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
EOF
}

#ECR

resource "aws_iam_policy" "ecr-access" {
  name = "ecr-access"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ecr:*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "s3-access" {
  name = "s3-access"
  policy = <<EOF
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
EOF
}

resource "aws_iam_policy" "secrets-access" {
  name = "secrets-access"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "secretsmanager:*",
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
EOF
}