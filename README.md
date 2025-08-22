
# Netlify Site + HCP Terraform Remote State

This project uses **Terraform** to deploy a static website on **Netlify**,  
with Terraform state stored securely in **HCP Terraform (Terraform Cloud)**.

The workflow:
1. Terraform provisions a GitHub repo for the site.
2. Terraform pushes the static site files to GitHub.
3. Netlify auto-deploys the site from GitHub.
4. Terraform state is stored remotely in HCP Terraform for collaboration.

---

## 🚀 Live Site
[https://curious-pasca-da123e.netlify.app](https://curious-pasca-da123e.netlify.app)

---

## 📦 Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.5+
- [Netlify account](https://app.netlify.com/signup)
- [GitHub account](https://github.com)
- [HCP Terraform](https://app.terraform.io/signup) account

---

## 🔑 Required Credentials

| Variable                | Where to Set                                |
|------------------------|-------------------------------------------|
| `NETLIFY_TOKEN`         | HCP Terraform Workspace Environment Var  |
| `GITHUB_TOKEN`          | HCP Terraform Workspace Terraform Var    |
| `GITHUB_OWNER`          | HCP Terraform Workspace Terraform Var    |

These credentials should **never** be committed to Git.

---

## 🏗️ Setup Instructions

### 1. Clone This Repo

```bash
git clone https://github.com/pojava/hcp-netlify-terraform.git
cd hcp-netlify-terraform
```

### 2. Prepare HCP Terraform Workspace

1. Log in to [HCP Terraform](https://app.terraform.io/).
2. Create a **CLI-Driven Workspace** (name: `netlify-hcp-terraform`).
3. Add variables:

| Variable Name | Type | Example Value |
|--------------|------|--------------|
| `github_owner` | Terraform | `pojava` |
| `github_token` | Terraform (Sensitive) | `<your GitHub PAT>` |
| `NETLIFY_TOKEN` | Environment (Sensitive) | `<your Netlify PAT>` |

---

### 3. Initialize Terraform

```bash
terraform init
```

Terraform will connect to HCP Terraform and configure the remote backend.

---

### 4. Plan & Apply

```bash
terraform plan
terraform apply
```

---

### 5. Outputs

After applying, Terraform prints:

| Output                | Description                       |
|----------------------|-----------------------------------|
| `netlify_site_url`   | The live Netlify site URL.       |
| `github_repo_url`    | The GitHub repo hosting the site.|

---

## 📂 Project Structure

```
hcp-netlify-terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── site/
│   └── index.html
├── netlify.toml
├── .gitignore
└── README.md
```

---

## 📸 Screenshot

![Terraform Apply Screenshot](screenshot(243).png)

---

## ✍️ Blog Post

[Link to blog post](https://dev.to/alao_abdulzahir/deploying-a-live-netlify-site-with-deploying-a-live-netlify-site-with-terraform-hcp-terraform-2fh) describing:
- Project idea
- Integration between Netlify + HCP Terraform
- Reproducibility steps

---

## 🔐 Security

- All sensitive credentials are stored as **HCP Terraform Workspace Variables**.
- No secrets are stored in code or Git.

---

## 🏆 Bonus

- Fully automated GitHub → Netlify deployment.
- Remote state for team collaboration.
