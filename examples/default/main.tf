
module "terraform-cloud-agent-kubernetes" {
  #source           = "redeux/terraform-cloud-agent/kubernetes"
  source = "../../"
  #version          = "0.1.0"
  namespace        = "terraform-cloud-agent"
  create_namespace = true
  agent_name       = "example-agent"
  agent_token      = var.agent_token

  create_cluster_role = true
}
