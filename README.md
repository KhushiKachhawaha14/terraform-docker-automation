# 🚀 Terraform Docker Automation

## 📌 Project Overview
This project demonstrates **Infrastructure as Code (IaC)** by automating the deployment of a web server using Terraform and Docker. Instead of manual setup, we define the entire environment—from pulling the image to configuring network ports—in a single configuration file.

## 🛠️ Tech Stack
* **Infrastructure Tool:** [HashiCorp Terraform](https://www.terraform.io/)
* **Containerization:** [Docker](https://www.docker.com/)
* **Provider:** `kreuzwerker/docker`
* **Web Server:** Nginx

## 📁 Project Structure
| File | Description |
| :--- | :--- |
| `main.tf` | The core configuration defining the Docker provider, Nginx image, and container resources. |
| `.gitignore` | Ensures local state files (`.tfstate`) and provider binaries are not tracked by Git. |
| `terraform.tfstate` | (Generated) Keeps track of the managed infrastructure's current state. |

## ⚙️ Configuration Details (`main.tf`)
The configuration includes several advanced IaC features:
* **Port Mapping:** Maps container port `80` to host port `8082`.
* **Resource Dependency:** Uses `depends_on` to ensure the container only starts after the image is successfully pulled.
* **Outputs:** Automatically displays the URL to access the web server once deployment is complete.

## 🏃 How to Run

### 1. Initialize
Download the required Docker provider plugins.
```bash
terraform init
```
### 2. Plan
Preview the changes Terraform will make to your local Docker environment.
```bash

terraform plan
```
### 3. Apply
Deploy the Nginx web server. Type yes when prompted.

```bash

terraform apply
```
Once finished, the terminal will output: web_server_url = "http://localhost:8082"

### 4. Verify
Open your browser and visit http://localhost:8082 to see the "Welcome to nginx!" page.

🧹 Cleanup
To stop the container and remove all created resources:

```bash

terraform destroy -auto-approve
```
### 💡 Best Practices Implemented
- **Provider Versioning**: Locked the Docker provider version for stability.

- **State Management**: Used .gitignore to keep sensitive state data out of version control.

 - **Automation**: Used restart = "always" to ensure container reliability.

