# terraform-cloud-agent-kubernetes
A Terraform module for deploying the Terraform Cloud for Business Agent in Kubernetes

## Example
```hcl
provider "kubernetes" {}

module "terraform-cloud-agent-kubernetes" {
  source  = "redeux/terraform-cloud-agent/kubernetes"
  version = "~> 1.0.1"

  namespace          = "terraform-cloud-agent"
  create_namespace   = true
  agent_name         = "example-agent"
  agent_token        = "myagent.atlasv1.secrettoken"
  cluster_access     = true
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_cluster_role.tfc_agent_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.tfc_agent_cluster_role_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_config_map.tfc_agent_configuration](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_deployment.tfc_agent](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_namespace.tfc_agent_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.tfc_agent_token](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service_account.tfc_agent_service_account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_auto_update"></a> [agent\_auto\_update](#input\_agent\_auto\_update) | By default, the agent will automatically update itself to the latest minor version | `string` | `"minor"` | no |
| <a name="input_agent_image"></a> [agent\_image](#input\_agent\_image) | Name of the Terraform Cloud Agent docker image. | `string` | `"hashicorp/tfc-agent"` | no |
| <a name="input_agent_log_level"></a> [agent\_log\_level](#input\_agent\_log\_level) | Available log levels are info, error, warn, debug, and trace. | `string` | `"error"` | no |
| <a name="input_agent_name"></a> [agent\_name](#input\_agent\_name) | The TFC agent token description defined in TFC at app/<org>/settings/agents. | `string` | n/a | yes |
| <a name="input_agent_replicas"></a> [agent\_replicas](#input\_agent\_replicas) | Replicacount of the terraform cloud agent deployment. | `number` | `1` | no |
| <a name="input_agent_token"></a> [agent\_token](#input\_agent\_token) | The TFC agent token generated when the agent was created. | `string` | n/a | yes |
| <a name="input_agent_version"></a> [agent\_version](#input\_agent\_version) | Version of the Terraform Cloud Agent docker image. | `string` | `"latest"` | no |
| <a name="input_cluster_role_rbac_api_groups"></a> [cluster\_role\_rbac\_api\_groups](#input\_cluster\_role\_rbac\_api\_groups) | Additional rbac api groups for the rbac role | `list(string)` | `[]` | no |
| <a name="input_cluster_role_rbac_resources"></a> [cluster\_role\_rbac\_resources](#input\_cluster\_role\_rbac\_resources) | Additional rbac resources for the rbac role | `list(string)` | `[]` | no |
| <a name="input_create_cluster_role"></a> [create\_cluster\_role](#input\_create\_cluster\_role) | When true, create a ClusterRole which provides the agent access to the cluster to manage Kubernetes resources. | `bool` | `false` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | When true, creates the namespace for the Terraform Cloud Agent. | `bool` | `false` | no |
| <a name="input_limits_cpu"></a> [limits\_cpu](#input\_limits\_cpu) | CPU hard limits. | `string` | `"2"` | no |
| <a name="input_limits_memory"></a> [limits\_memory](#input\_limits\_memory) | Memory hard limits. | `string` | `"2Gi"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace to deploy the agent into.  Unless create\_namespace is true, the namespace must already exist. | `string` | n/a | yes |
| <a name="input_requests_cpu"></a> [requests\_cpu](#input\_requests\_cpu) | CPU requests. | `string` | `"500m"` | no |
| <a name="input_requests_memory"></a> [requests\_memory](#input\_requests\_memory) | Memory requests. | `string` | `"250Mi"` | no |
| <a name="input_service_account_annotations"></a> [service\_account\_annotations](#input\_service\_account\_annotations) | Annotations to add to the Kubernetes service account. Can be used to annotate the IRSA. | `map(string)` | `{}` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Name of the service account. | `string` | `"terraform-cloud-agent"` | no |
| <a name="input_tfc_url"></a> [tfc\_url](#input\_tfc\_url) | The Terraform Cloud endpoint.  Must be changed if using Terraform Enterprise. | `string` | `"https://app.terraform.io"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfc_agent"></a> [tfc\_agent](#output\_tfc\_agent) | Name of the TFC Agent Deployment |
| <a name="output_tfc_agent_service_account"></a> [tfc\_agent\_service\_account](#output\_tfc\_agent\_service\_account) | Name of the Service Account for TFC Agent |
<!-- END_TF_DOCS -->

**Note**: This is a community module and is not supported by HashiCorp.
