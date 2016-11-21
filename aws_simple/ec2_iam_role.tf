
resource "aws_iam_instance_profile" "ec2base_profile" {
    depends_on = ["aws_iam_role_policy.ec2base_role_policy"]

    name = "ec2base_profile"
    roles = ["${aws_iam_role.ec2base_role.name}"]
}

resource "aws_iam_role_policy" "ec2base_role_policy" {
  depends_on = ["aws_iam_role.ec2base_role"]

    name = "ec2base_role_policy"
    role = "${aws_iam_role.ec2base_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "ec2base_role" {
    name = "ec2base_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
