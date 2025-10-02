# PyTorch GPU Development Environment with Docker

This is a template for building a PyTorch development environment that utilizes NVIDIA GPUs with Docker Compose.

The goal is to create an isolated and reproducible environment for machine learning projects, ensuring that dependencies are consistent for everyone.

---

## 🎯 Features

- **Reproducible**: The `Dockerfile` ensures that the same environment can be built every time.
- **Portable**: This development environment can be reproduced on any machine that runs Docker.
- **GPU Enabled**: Ready for model training and inference using NVIDIA GPUs.
- **Efficient**: Start and stop the entire environment with simple Docker Compose commands.

---

## 🔧 Environment

- Ubuntu 22.04
- NVIDIA CUDA Toolkit 12.1
- Python 3.10
- PyTorch (with CUDA support)

---

## ✅ Prerequisites

Before you begin, ensure you have the following installed and configured on your host machine:

- An NVIDIA GPU
- An up-to-date [NVIDIA Driver](https://www.nvidia.com/Download/index.aspx)
- [Docker](https://www.docker.com/products/docker-desktop/)
- A Docker environment configured for GPU access:
  - (For Windows) WSL 2 integration enabled in Docker Desktop
  - (For Linux) NVIDIA Container Toolkit

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone [repository-url]
cd [repository-directory-name]
```

# Build and Run the Container
Run the following command to build the image from the Dockerfile and start the container in the background according to the settings in docker-compose.yml.
```bash
docker compose up --build -d
```

# Enter the Container
To get a shell inside the running container, execute the following command.
```bash
docker compose exec app /bin/bash
```

# Verify GPU Access
After entering the container, start Python and run the following code to check if PyTorch is correctly recognizing the GPU.
```python
import torch
print(torch.cuda.is_available())
```