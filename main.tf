terraform {
  required_version = ">= 1.5.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  owner = var.github_owner

  app_auth {
    id              = var.github_app_id
    installation_id = var.github_app_installation_id
    pem_file        = file(var.github_app_pem_file)
  }
}

resource "github_repository" "this" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = var.visibility

  has_issues      = var.has_issues
  has_projects    = var.has_projects
  has_wiki        = var.has_wiki
  has_discussions = var.has_discussions

  auto_init            = var.auto_init
  gitignore_template   = var.gitignore_template
  license_template     = var.license_template

  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  allow_auto_merge       = var.allow_auto_merge
  delete_branch_on_merge = var.delete_branch_on_merge

  topics = var.topics

  vulnerability_alerts = var.vulnerability_alerts
}

resource "github_branch_default" "this" {
  count      = var.default_branch != null ? 1 : 0
  repository = github_repository.this.name
  branch     = var.default_branch

  depends_on = [github_repository.this]
}

resource "github_branch_protection" "this" {
  count         = var.enable_branch_protection ? 1 : 0
  repository_id = github_repository.this.node_id
  pattern       = var.default_branch != null ? var.default_branch : "main"

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = var.required_approving_review_count
  }

  enforce_admins = var.enforce_admins
}
