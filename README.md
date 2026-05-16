# Terraform GitHub Repository

Terraform project to create and manage a GitHub repository using the [integrations/github](https://registry.terraform.io/providers/integrations/github/latest/docs) provider.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.5.0
- A [GitHub personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) with the following scopes:
  - `repo` (full control of private repositories)
  - `delete_repo` (required to destroy the repository via Terraform)
  - `admin:org` (if managing repositories inside an organization)

## Usage

1. **Clone and enter the project:**

   ```bash
   git clone https://github.com/0xHackerSpace/terraformGithubRepo.git
   cd terraformGithubRepo
   ```

2. **Create your variable file:**

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

   Edit `terraform.tfvars` and fill in your `github_token`, `github_owner`, and `repository_name`.

3. **Initialize Terraform:**

   ```bash
   terraform init
   ```

4. **Preview the changes:**

   ```bash
   terraform plan
   ```

5. **Apply the configuration:**

   ```bash
   terraform apply
   ```

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `github_token` | GitHub personal access token | `string` | — | yes |
| `github_owner` | GitHub organization or user | `string` | — | yes |
| `repository_name` | Name of the repository | `string` | — | yes |
| `repository_description` | Short description | `string` | `""` | no |
| `visibility` | `public`, `private`, or `internal` | `string` | `"private"` | no |
| `has_issues` | Enable Issues | `bool` | `true` | no |
| `has_wiki` | Enable Wiki | `bool` | `false` | no |
| `has_discussions` | Enable Discussions | `bool` | `false` | no |
| `auto_init` | Initialize with README | `bool` | `true` | no |
| `gitignore_template` | Gitignore template name | `string` | `null` | no |
| `license_template` | SPDX license identifier | `string` | `null` | no |
| `allow_squash_merge` | Allow squash merges | `bool` | `true` | no |
| `delete_branch_on_merge` | Delete branch after merge | `bool` | `true` | no |
| `topics` | Repository topics | `list(string)` | `[]` | no |
| `vulnerability_alerts` | Enable vulnerability alerts | `bool` | `true` | no |
| `default_branch` | Default branch name | `string` | `"main"` | no |
| `enable_branch_protection` | Enable branch protection | `bool` | `false` | no |
| `required_approving_review_count` | Required PR approvals | `number` | `1` | no |
| `enforce_admins` | Enforce rules for admins | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| `repository_full_name` | Full name (`owner/repo`) |
| `repository_html_url` | URL on GitHub |
| `repository_ssh_clone_url` | SSH clone URL |
| `repository_http_clone_url` | HTTPS clone URL |
| `repository_default_branch` | Default branch name |

## Security Notes

- **Never commit `terraform.tfvars`** — it contains your GitHub token. It is excluded by `.gitignore`.
- **Never commit `*.tfstate`** — state files may contain sensitive data.
- Use a secrets manager (e.g., HashiCorp Vault, AWS Secrets Manager) or environment variables for token injection in CI/CD:

  ```bash
  export TF_VAR_github_token="ghp_..."
  ```
