output "site_repo_name" {
  value = github_repository.site.name
}

output "site_repo_url" {
  value = github_repository.site.html_url
}

output "next_step_netlify_import_url" {
  value = "https://app.netlify.com/start"
}

output "reminder" {
  value = "In Netlify: Add New Site → Import from Git → pick this repo → set Publish directory to '/' → Deploy site."
}
