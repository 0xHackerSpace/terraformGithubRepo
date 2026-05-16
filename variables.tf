# ---------------------------------------------------------------------------
# GitHub App Authentication
# ---------------------------------------------------------------------------

variable "github_app_id" {
  description = "The GitHub App ID. Found in the App's settings page."
  type        = string
}

variable "github_app_installation_id" {
  description = "The installation ID of the GitHub App on the target organization or user account."
  type        = string
}

variable "github_app_pem_file" {
  description = "Path to the private key PEM file downloaded from the GitHub App settings."
  type        = string
}

variable "github_owner" {
  description = "GitHub organization or user that will own the repository."
  type        = string
}

# ---------------------------------------------------------------------------
# Repository settings
# ---------------------------------------------------------------------------

variable "repository_name" {
  description = "Name of the GitHub repository to create."
  type        = string
}

variable "repository_description" {
  description = "Short description of the repository."
  type        = string
  default     = ""
}

variable "visibility" {
  description = "Visibility of the repository. Can be 'public', 'private', or 'internal'."
  type        = string
  default     = "private"

  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "visibility must be one of: public, private, internal."
  }
}

variable "has_issues" {
  description = "Enable GitHub Issues for the repository."
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "Enable GitHub Projects for the repository."
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "Enable GitHub Wiki for the repository."
  type        = bool
  default     = false
}

variable "has_discussions" {
  description = "Enable GitHub Discussions for the repository."
  type        = bool
  default     = false
}

variable "auto_init" {
  description = "Initialize the repository with a README on creation."
  type        = bool
  default     = true
}

variable "gitignore_template" {
  description = "Gitignore template to apply (e.g. 'Terraform', 'Python'). Must match a GitHub template name."
  type        = string
  default     = null
}

variable "license_template" {
  description = "License template to apply (e.g. 'mit', 'apache-2.0'). Must match a GitHub SPDX license identifier."
  type        = string
  default     = null
}

variable "allow_merge_commit" {
  description = "Allow merge commits."
  type        = bool
  default     = false
}

variable "allow_squash_merge" {
  description = "Allow squash merges."
  type        = bool
  default     = true
}

variable "allow_rebase_merge" {
  description = "Allow rebase merges."
  type        = bool
  default     = false
}

variable "allow_auto_merge" {
  description = "Allow auto-merging pull requests."
  type        = bool
  default     = false
}

variable "delete_branch_on_merge" {
  description = "Automatically delete head branches after pull requests are merged."
  type        = bool
  default     = true
}

variable "topics" {
  description = "List of topics to apply to the repository."
  type        = list(string)
  default     = []
}

variable "vulnerability_alerts" {
  description = "Enable security vulnerability alerts."
  type        = bool
  default     = true
}

variable "default_branch" {
  description = "Name of the default branch. Set to null to skip branch configuration."
  type        = string
  default     = "main"
}

variable "enable_branch_protection" {
  description = "Enable branch protection on the default branch."
  type        = bool
  default     = false
}

variable "required_approving_review_count" {
  description = "Number of required approving reviews before merging. Used when branch protection is enabled."
  type        = number
  default     = 1
}

variable "enforce_admins" {
  description = "Enforce branch protection rules for repository admins. Used when branch protection is enabled."
  type        = bool
  default     = false
}
