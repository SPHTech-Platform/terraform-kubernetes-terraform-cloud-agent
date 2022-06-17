data "aws_caller_identity" "current" {
}

data "aws_partition" "current" {
}

data "aws_region" "current" {
}

data "aws_iam_policy_document" "tfc_agent" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = [for account in var.tfc_agent_accounts : "arn:aws:iam::${account}:role/${var.tfc_agent_role}"]
  }
}

data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
