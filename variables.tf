variable "agent_auto_update" {
  type        = string
  default     = "minor"
  description = "By default, the agent will automatically update itself to the latest minor version"
  validation {
    condition     = contains(["disabled", "minor", "patch"], var.agent_auto_update)
    error_message = "Defaults to minor, must be one of *disabled*, *minor*, or *patch*."
  }
}

variable "agent_image" {
  type        = string
  default     = "hashicorp/tfc-agent"
  description = "Name of the Terraform Cloud Agent docker image."
}

variable "agent_log_level" {
  type        = string
  default     = "error"
  description = "Available log levels are info, error, warn, debug, and trace."
}

variable "agent_name" {
  type        = string
  description = "The TFC agent token description defined in TFC at app/<org>/settings/agents."
}

variable "agent_replicas" {
  type        = number
  default     = 1
  description = "Replicacount of the terraform cloud agent deployment."
}

variable "agent_token" {
  type        = string
  description = "The TFC agent token generated when the agent was created."
  sensitive   = true
}

variable "agent_version" {
  type        = string
  default     = "latest"
  description = "Version of the Terraform Cloud Agent docker image."
}

variable "create_cluster_role" {
  description = "When true, create a ClusterRole which provides the agent access to the cluster to manage Kubernetes resources."
  type        = bool
  default     = false
}

variable "cluster_role_rbac_api_groups" {
  description = "Additional rbac api groups for the rbac role"
  type        = list(string)
  default     = []
}

variable "cluster_role_rbac_resources" {
  description = "Additional rbac resources for the rbac role"
  type        = list(string)
  default     = []
}

variable "create_namespace" {
  type        = bool
  default     = false
  description = "When true, creates the namespace for the Terraform Cloud Agent."
}

variable "limits_cpu" {
  type        = string
  default     = "2"
  description = "CPU hard limits."
}

variable "limits_memory" {
  type        = string
  default     = "2Gi"
  description = "Memory hard limits."
}

variable "namespace" {
  type        = string
  description = "The namespace to deploy the agent into.  Unless create_namespace is true, the namespace must already exist."
}

variable "requests_cpu" {
  type        = string
  default     = "500m"
  description = "CPU requests."
}

variable "requests_memory" {
  type        = string
  default     = "250Mi"
  description = "Memory requests."
}

variable "tfc_url" {
  type        = string
  default     = "https://app.terraform.io"
  description = "The Terraform Cloud endpoint.  Must be changed if using Terraform Enterprise."
}

variable "service_account_name" {
  type        = string
  default     = "terraform-cloud-agent"
  description = "Name of the service account."
}

variable "service_account_annotations" {
  type        = map(string)
  default     = {}
  description = "Annotations to add to the Kubernetes service account. Can be used to annotate the IRSA."
}
