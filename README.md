
# Node.js Demo App with CI/CD on AWS EC2

A sample **Node.js web application** with an automated CI/CD pipeline using **GitHub Actions**, **DockerHub**, and **AWS EC2 (Amazon Linux 2)**.

---

## 📌 Features

* Lightweight HTTP server written in Node.js.
* Containerized with Docker for easy deployment.
* CI/CD pipeline:

  * Run tests and build app.
  * Build and push Docker image to DockerHub.
  * Deploy to EC2 via SSH.

---

## 🚀 Getting Started

### Prerequisites

* AWS account with EC2 access.
* GitHub repository (`nodejs-demo-app`).
* DockerHub account.
* SSH key pair for EC2.

### Installation

1. **Clone the repository**:

   ```bash
   git clone git@github.com:<GITHUB_USER>/nodejs-demo-app.git
   cd nodejs-demo-app
   ```

2. **Install dependencies locally (optional)**:

   ```bash
   npm install
   npm start
   ```

---

## 🐳 Docker Support

Build and run the app locally with Docker:

```bash
docker build -t nodejs-demo-app .
docker run -p 3000:3000 nodejs-demo-app
```

Visit [http://localhost:3000](http://localhost:3000).

---

## 🔄 CI/CD Workflow

The pipeline is defined in `.github/workflows/main.yml`:

1. **Build & Test**: Run `npm ci` and `npm test`.
2. **Build Image**: Create a Docker image of the app.
3. **Push Image**: Upload image to DockerHub.
4. **Deploy**: SSH into EC2, pull image, and restart container.

Trigger: Push to the `main` branch.

---

## 🔑 GitHub Secrets

| Name                  | Purpose                        |
| --------------------- | ------------------------------ |
| `DOCKERHUB_USERNAME`  | DockerHub username             |
| `DOCKERHUB_TOKEN`     | DockerHub access token         |
| `EC2_HOST`            | EC2 public IP or DNS           |
| `EC2_SSH_PRIVATE_KEY` | SSH private key for deployment |

> Add these under **Settings → Secrets and variables → Actions**.

---

## 🌐 Deployment on EC2

The pipeline pulls the image and runs it on EC2:

```bash
docker run -d --name nodejs-demo-app -p 3000:3000 --restart unless-stopped <DOCKERHUB_USERNAME>/nodejs-demo-app:latest
```

Access your app at:

```
http://<EC2_PUBLIC_IP>:3000
```

---

## 🧰 Troubleshooting

* **Port not accessible**: Check EC2 security group allows port 3000.
* **Docker permission denied**: Add `ec2-user` to `docker` group.
* **Workflow fails**: Verify GitHub Secrets and Action logs.

---

## 📄 License

This project is licensed under the MIT License.

---

## 👤 Author

Maintained by **<Your Name>** as part of a DevOps internship task.

---

### ⭐️ If you find this helpful, give the repository a star!
