terraform {
  cloud {
    # 👇 replace with your HCP org + an existing CLI-driven workspace
    organization = "hug_tf"

    workspaces {
      name = "netlify-hcp"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.6"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}

# --- Providers ---
provider "github" {
  token = var.github_token
  # owner can be omitted for personal accounts, but we accept it via var for clarity
  owner = var.github_owner
}

# --- Uniqueness for repo name ---
resource "random_pet" "suffix" {
  length    = 2
  separator = "-"
}

# --- GitHub repo (public) ---
resource "github_repository" "site" {
  name        = "hcp-netlify-${random_pet.suffix.id}"
  description = "Static site deployed via Netlify; repo created by Terraform"
  visibility  = "public"
  auto_init   = true
}

# --- Add index.html at repo root ---
resource "github_repository_file" "index" {
  repository          = github_repository.site.name
  branch              = "main"
  file                = "index.html"
  content             = file("${path.module}/site/index.html")
  commit_message      = "chore: add index.html"
  overwrite_on_create = true
}

# --- Add netlify.toml at repo root ---
resource "github_repository_file" "netlify_toml" {
  repository          = github_repository.site.name
  branch              = "main"
  file                = "netlify.toml"
  content             = file("${path.module}/netlify.toml")
  commit_message      = "chore: add netlify.toml"
  overwrite_on_create = true
}
