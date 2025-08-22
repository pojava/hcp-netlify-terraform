variable "github_token" {
  description = "GitHub Personal Access Token with repo scope"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "GitHub username or org to own the repo"
  type        = string
}