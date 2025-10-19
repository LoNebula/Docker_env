# Docker Environment Collection

This repository is a collection of Docker and Docker Compose-based environment configurations tailored for various development scenarios.

-----

## 🎯 Overview

This repository contains multiple, independent Docker environments, each located in its own sub-directory. The goal is to provide isolated, reproducible, and portable setups for specific tasks.

  - **Reproducible**: `Dockerfile` specifications ensure the same environment can be built every time.
  - **Portable**: These environments can be reproduced on any machine that runs Docker.
  - **Efficient**: Start and stop entire environments with simple `docker compose` commands.

-----

## 🔧 Environments Included

### 1\. `cuda_llm_server`

**PyTorch & Ollama GPU Development Environment**

This environment is designed for machine learning projects that require both PyTorch for development and a persistent Ollama server for LLM inference, all utilizing NVIDIA GPUs.

  * **Base**: Ubuntu 22.04, NVIDIA CUDA Toolkit 12.1
  * **Key Software**: Python 3.11, PyTorch (with CUDA 12.1 support), Ollama Server
  * **Features**: The Ollama server starts automatically on container launch, and model data is saved in a persistent Docker volume.

### 2\. `python_cuda_torch`

**PyTorch GPU Development Environment**

A simple, focused environment for machine learning development using PyTorch with NVIDIA GPU acceleration.

  * **Base**: Ubuntu 22.04, NVIDIA CUDA Toolkit 12.1
  * **Key Software**: Python 3.10, PyTorch (with CUDA 12.1 support)
  * **Features**: Ideal for model training and inference scripts that require GPU access.

### 3\. `python_data_science`

**Data Science Development Environment (VS Code Dev Container)**

A data analysis environment built on the Jupyter data science stack and optimized for use with VS Code Dev Containers.

  * **Base**: `jupyter/datascience-notebook:x86_64-ubuntu-22.04`
  * **Key Software**: Python 3.10, pandas, numpy
  * **Features**: Designed to be opened directly in VS Code ("Reopen in Container") for a seamless data science workflow.

-----

## ✅ General Prerequisites

For the GPU-enabled environments (`cuda_llm_server` and `python_cuda_torch`), you must have the following installed and configured on your host machine:

  - An NVIDIA GPU
  - An up-to-date [NVIDIA Driver](https://www.nvidia.com/Download/index.aspx)
  - [Docker](https://www.docker.com/products/docker-desktop/)
  - A Docker environment configured for GPU access:
      - (For Windows) WSL 2 integration enabled in Docker Desktop
      - (For Linux) NVIDIA Container Toolkit

-----

## 🚀 How to Use

1.  Clone this repository.
2.  Navigate into the sub-directory of the environment you wish to use (e.g., `cd cuda_llm_server`).
3.  Follow the instructions in that directory's specific `README.md` to build and run the container.

**Example (for `cuda_llm_server`):**

```bash
# Navigate to the environment directory
cd cuda_llm_server

# Build and run the container in the background
docker compose up --build -d

# Enter the running container
docker compose exec app /bin/bash
```