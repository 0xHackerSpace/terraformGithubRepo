output "repository_id" {
  description = "The ID of the GitHub repository."
  value       = github_repository.this.id
}

output "repository_node_id" {
  description = "The node ID of the GitHub repository."
  value       = github_repository.this.node_id
}

output "repository_name" {
  description = "The name of the GitHub repository."
  value       = github_repository.this.name
}

output "repository_full_name" {
  description = "The full name (owner/name) of the GitHub repository."
  value       = github_repository.this.full_name
}

output "repository_html_url" {
  description = "The URL to access the repository on GitHub."
  value       = github_repository.this.html_url
}

output "repository_ssh_clone_url" {
  description = "The SSH clone URL for the repository."
  value       = github_repository.this.ssh_clone_url
}

output "repository_http_clone_url" {
  description = "The HTTPS clone URL for the repository."
  value       = github_repository.this.http_clone_url
}

output "repository_git_clone_url" {
  description = "The git clone URL for the repository."
  value       = github_repository.this.git_clone_url
}

output "repository_visibility" {
  description = "The visibility of the repository."
  value       = github_repository.this.visibility
}

output "repository_default_branch" {
  description = "The name of the default branch."
  value       = github_repository.this.default_branch
}
