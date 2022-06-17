/*resource "aws_iam_role" "tfc_agent" {
  name        = "${var.cluster_name}-tfc-agent"
  description = "IAM Role for the Agent in Cluster ${var.cluster_name}"

  assume_role_policy    = data.aws_iam_policy_document.ec2_assume_role_policy.json
  managed_policy_arns   = [aws_iam_policy.tfc_agent.arn]
  force_detach_policies = true
}

resource "aws_iam_policy" "tfc_agent" {
  name   = "tfc_agent_policy2"
  path   = "/"
  policy = data.aws_iam_policy_document.tfc_agent.json
}*/

module "tfc_agent_irsa_role" {  
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.1.0"

  role_name        = "${var.cluster_name}-tfc-agent"
  role_description = "EKS Cluster ${var.cluster_name} TFC Agent Addon"

  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["tfc-agent:terraform-cloud-agent"]
    }
  }
}

resource "aws_iam_role_policy" "tfc_agent" {
  name        = "tfc_agent_policy2"
  role        = module.tfc_agent_irsa_role.iam_role_name

  policy      = data.aws_iam_policy_document.tfc_agent.json
}
