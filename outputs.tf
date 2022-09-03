output "tfc_agent" {
  description = "Name of the TFC Agent Deployment"
  value        = kubernetes_deployment.tfc_agent.metadata[0].name
}

output "tfc_agent_service_account" {
  description = "Name of the Service Account for TFC Agent"
  value       = kubernetes_service_account.tfc_agent_service_account.metadata[0].name
}
