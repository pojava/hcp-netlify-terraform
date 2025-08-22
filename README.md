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
