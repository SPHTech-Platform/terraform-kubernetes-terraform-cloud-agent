module "tfc_agent_irsa_role" { 
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.1.0"

  role_name        = "eks-service-tfc-agent"
  role_description = "EKS Cluster eks-service TFC Agent Addon"

  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["tfc-agent:terraform-cloud-agent"]
    }
  }
}

resource "aws_iam_role_policy" "tfc_agent" {
  name        = "tfc_agent_aws_policy"
  role        = module.tfc_agent_irsa_role.iam_role_name
  
  policy      = data.aws_iam_policy_document.tfc_agent.json
}

