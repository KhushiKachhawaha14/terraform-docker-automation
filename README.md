# 🚀 DevOps Internship - Task 4: IaC with Terraform and Docker
## Project Objective
This project demonstrates the core principles of **Infrastructure as Code (IaC)** by using **HashiCorp Terraform** to provision and manage a simple Docker container locally. The goal is to automate the deployment lifecycle (init, plan, apply, destroy) of a containerized application.
---
## 🛠️ Prerequisites
Before starting, ensure you have the following tools installed and configured:
1.  **Docker Engine:** Must be installed and running on your machine (used to host the container).
2.  **Terraform CLI:** Must be installed (used to define and execute the infrastructure code).
---
## 📁 Project Structure
The root directory contains the essential Terraform configuration file:
### `main.tf` Description
The `main.tf` file defines two primary resources using the **Docker Provider**:
1.  **`docker_image`**: Pulls the `hello-world:latest` image from Docker Hub.
2.  **`docker_container`**: Creates and runs a container named `terraform-hello-container` using the pulled image.
---
## 🏃 Getting Started (Execution Guide)
Follow these steps in your terminal from the directory containing `main.tf` to provision the infrastructure.

Step 1: Initialize the Working Directory
This command downloads the **Docker Provider** and sets up the necessary local files.
```bash
terraform init
Step 2: Review the Execution Plan
This is a crucial step for IaC safety. The plan command shows exactly what actions Terraform will take (i.e., 2 to add
Step 3: Apply the Configuration
This command executes the plan, provisions the resources, and creates the container
terraform plan
After a successful apply, you can verify the container ran and exited successfully using the Docker CLI:
docker ps -a | grep terraform-hello-container
Step 4: Check Terraform State
terraform state list
🧹 Cleanup (Destroying Resources)
terraform destroy


